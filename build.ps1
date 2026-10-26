<#
.SYNOPSIS
Build the module into out/KanaLock, the folder Import-Module and Publish-PSResource take.
#>
param([ValidateSet('Debug', 'Release')][string]$Configuration = 'Release')

$ErrorActionPreference = 'Stop'
$out = Join-Path $PSScriptRoot 'out/KanaLock'

dotnet publish (Join-Path $PSScriptRoot 'src/KanaLock') -c $Configuration -o (Join-Path $PSScriptRoot 'out/bin') --nologo
if ($LASTEXITCODE) { throw "dotnet publish failed: $LASTEXITCODE" }

Remove-Item -LiteralPath $out -Recurse -Force -ErrorAction Ignore
New-Item -ItemType Directory -Path $out | Out-Null
Copy-Item (Join-Path $PSScriptRoot 'out/bin/KanaLock.dll'), (Join-Path $PSScriptRoot 'KanaLock.psd1'), (Join-Path $PSScriptRoot 'LICENSE') -Destination $out

Import-Module Microsoft.PowerShell.PlatyPS -RequiredVersion 1.0.3
$maml = Join-Path $PSScriptRoot 'out/maml'
Remove-Item -LiteralPath $maml -Recurse -Force -ErrorAction Ignore
Get-ChildItem (Join-Path $PSScriptRoot 'docs/cmdlets/KanaLock/*-*.md') |
    Import-MarkdownCommandHelp |
    Export-MamlCommandHelp -OutputFolder $maml | Out-Null
New-Item -ItemType Directory -Path (Join-Path $out 'en-US') | Out-Null
Copy-Item (Join-Path $maml 'KanaLock/KanaLock.dll-Help.xml') -Destination (Join-Path $out 'en-US')
