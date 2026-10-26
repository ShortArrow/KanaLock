BeforeAll {
    $script:manifest = Join-Path $PSScriptRoot '../out/KanaLock/KanaLock.psd1'
    Import-Module $script:manifest -Force
}

Describe 'KeyState.IsToggled' {
    It 'is toggled when the low bit is set' {
        [KanaLock.KeyState]::IsToggled(1) | Should -BeTrue
    }

    It 'is not toggled when only the high (pressed) bit is set' {
        [KanaLock.KeyState]::IsToggled([int16]-128) | Should -BeFalse
    }

    It 'is toggled when both pressed and toggled' {
        [KanaLock.KeyState]::IsToggled([int16]-127) | Should -BeTrue
    }

    It 'is not toggled at 0' {
        [KanaLock.KeyState]::IsToggled(0) | Should -BeFalse
    }
}

Describe 'KanaLock module' {
    It 'exports exactly Get-KanaLock, Enable-KanaLock and Disable-KanaLock' {
        (Get-Command -Module KanaLock).Name | Sort-Object |
            Should -Be @('Disable-KanaLock', 'Enable-KanaLock', 'Get-KanaLock')
    }
}

Describe 'Get-KanaLock' {
    It 'returns a boolean' {
        Get-KanaLock | Should -BeOfType [bool]
    }
}
