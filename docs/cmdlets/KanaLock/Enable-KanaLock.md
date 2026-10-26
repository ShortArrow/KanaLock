---
document type: cmdlet
external help file: KanaLock.dll-Help.xml
HelpUri: https://github.com/ShortArrow/KanaLock/blob/main/docs/cmdlets/KanaLock/Enable-KanaLock.md
Locale: en-US
Module Name: KanaLock
ms.date: 10/26/2026
PlatyPS schema version: 2024-05-01
title: Enable-KanaLock
---

# Enable-KanaLock

## SYNOPSIS

Turns kana lock on.

## SYNTAX

### __AllParameterSets

```
Enable-KanaLock [<CommonParameters>]
```

## ALIASES

None.

## DESCRIPTION

Sends one kana key press when kana lock is off; does nothing when it is already on.

Use it to reproduce the half-width kana symptom on demand, for example to check that `Disable-KanaLock` clears it.

## EXAMPLES

### Example 1: Turn kana lock on

```powershell
Enable-KanaLock
Get-KanaLock
```

`Get-KanaLock` then returns `$true`.

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

### None

This cmdlet returns no output.

## NOTES

The state read and changed is that of the interactive desktop. Behaviour in session 0 (services, scheduled tasks, CI runners) is unspecified.

## RELATED LINKS

- [Get-KanaLock](Get-KanaLock.md)
- [Disable-KanaLock](Disable-KanaLock.md)
