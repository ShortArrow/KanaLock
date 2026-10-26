# KanaLock

Read and clear the kana lock (`VK_KANA`) toggle on Windows from PowerShell.

With kana lock on, a field that turns the IME off, such as a password field or
pinentry's passphrase prompt, receives letters as half-width kana: `test`
arrives as `ｶｲﾄｶ`. The IME indicator still shows half-width alphanumeric, and a
101-key keyboard has no kana key to clear it by hand.

## Install

```powershell
Install-PSResource KanaLock   # PowerShell 7.4+
Install-Module KanaLock       # Windows PowerShell 5.1, PowerShell 7.0-7.3
```

Windows only. Works on Windows PowerShell 5.1 and PowerShell 7.

## Usage

```powershell
Get-KanaLock       # True when kana lock is on
Enable-KanaLock    # turn it on; does nothing when already on
Disable-KanaLock   # turn it off; does nothing when already off
```

Warn on shell start from your profile:

```powershell
if (Get-KanaLock) { Write-Warning 'kana lock is on; run Disable-KanaLock' }
```

## Reproduce

pinentry prints back what it received, so it shows the symptom directly. With
[Gpg4win](https://gpg4win.org/) installed, type `test` into each dialog (not a
real passphrase: it is printed back):

```powershell
$pinentry = 'C:\Program Files\Gpg4win\bin\pinentry.exe'
Enable-KanaLock
"GETPIN`nBYE`n" | & $pinentry    # D ｶｲﾄｶ
Disable-KanaLock
"GETPIN`nBYE`n" | & $pinentry    # D test
```

## Build and test

Requires the .NET SDK.

```powershell
./build.ps1             # builds into out/KanaLock
Invoke-Pester ./tests
```

## License

[MIT](LICENSE)
