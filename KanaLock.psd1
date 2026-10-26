@{
    RootModule           = 'KanaLock.dll'
    ModuleVersion        = '0.1.0'
    GUID                 = '431c0935-d5d8-48fa-926e-5163ce3295dd'
    Author               = 'ShortArrow'
    Copyright            = '(c) 2026 ShortArrow. MIT License.'
    Description          = 'Read and clear the kana lock (VK_KANA) toggle on Windows, which turns typed letters into half-width kana wherever the IME is off and cannot be cleared by hand on a 101-key keyboard.'
    PowerShellVersion    = '5.1'
    CompatiblePSEditions = @('Desktop', 'Core')
    FunctionsToExport    = @()
    CmdletsToExport      = @('Get-KanaLock', 'Enable-KanaLock', 'Disable-KanaLock')
    VariablesToExport    = @()
    AliasesToExport      = @()
    PrivateData          = @{
        PSData = @{
            Tags       = @('Windows', 'Keyboard', 'IME', 'Japanese', 'Kana', 'PSEdition_Desktop', 'PSEdition_Core')
            LicenseUri = 'https://github.com/ShortArrow/KanaLock/blob/main/LICENSE'
            ProjectUri = 'https://github.com/ShortArrow/KanaLock'
        }
    }
}
