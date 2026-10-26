---
document type: cmdlet
external help file: KanaLock.dll-Help.xml
HelpUri: https://github.com/ShortArrow/KanaLock/blob/main/docs/cmdlets/KanaLock/Get-KanaLock.md
Locale: en-US
Module Name: KanaLock
ms.date: 10/26/2026
PlatyPS schema version: 2024-05-01
title: Get-KanaLock
---

# Get-KanaLock

## SYNOPSIS

Returns whether kana lock is on.

## SYNTAX

### __AllParameterSets

```
Get-KanaLock [<CommonParameters>]
```

## ALIASES

None.

## DESCRIPTION

With kana lock (VK_KANA) on, a field that turns the IME off, such as a password field or pinentry's passphrase prompt, receives letters as half-width kana: `test` arrives as `ｶｲﾄｶ`. The IME indicator still shows half-width alphanumeric.

`Get-KanaLock` returns `$true` when kana lock is on and `$false` when it is off.

## EXAMPLES

### Example 1: Check the state

```powershell
Get-KanaLock
```

Returns `$true` or `$false`.

### Example 2: Warn from a profile

```powershell
if (Get-KanaLock) { Write-Warning 'kana lock is on; run Disable-KanaLock' }
```

Warns at shell start before a passphrase is mistyped.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

You can't pipe objects to this cmdlet.

## OUTPUTS

### System.Boolean

`$true` when kana lock is on; otherwise `$false`.

## NOTES

The state read and changed is that of the interactive desktop. Behaviour in session 0 (services, scheduled tasks, CI runners) is unspecified.

## RELATED LINKS

- [Enable-KanaLock](Enable-KanaLock.md)
- [Disable-KanaLock](Disable-KanaLock.md)
