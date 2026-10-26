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
