---
document type: cmdlet
external help file: KanaLock.dll-Help.xml
HelpUri: https://github.com/ShortArrow/KanaLock/blob/main/docs/cmdlets/KanaLock/Disable-KanaLock.md
Locale: en-US
Module Name: KanaLock
ms.date: 10/26/2026
PlatyPS schema version: 2024-05-01
title: Disable-KanaLock
---

# Disable-KanaLock

## SYNOPSIS

Turns kana lock off.

## SYNTAX

### __AllParameterSets

```
Disable-KanaLock [<CommonParameters>]
```

## ALIASES

None.

## DESCRIPTION

Sends one kana key press when kana lock is on; does nothing when it is already off.

A 101-key keyboard has no kana key, so kana lock cannot be cleared by hand there.

## EXAMPLES

### Example 1: Turn kana lock off

```powershell
Disable-KanaLock
Get-KanaLock
```

`Get-KanaLock` then returns `$false`.

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
- [Enable-KanaLock](Enable-KanaLock.md)
