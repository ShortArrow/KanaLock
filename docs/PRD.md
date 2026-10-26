# KanaLock PRD

## Problem

With kana lock (`VK_KANA`) on, a field that turns the IME off, such as a
password field or pinentry's passphrase prompt, receives letters as half-width
kana: `test` arrives as `ｶｲﾄｶ`. The IME indicator still shows half-width
alphanumeric, so nothing on screen explains why a correct passphrase is
rejected.

Kana lock can end up on without anyone pressing a kana key; how it got there
is often unknown. A 101-key keyboard has no kana key to turn it off again by
hand.

## Users

People on Windows with a Japanese IME and a keyboard without a kana key, who
type passphrases into IME-off fields: GnuPG, SSH, sudo prompts, password boxes.

## Goals

- Tell whether kana lock is on, so a profile or script can warn before a
  passphrase is mistyped.
- Turn kana lock off without a kana key.
- Turn it on, so the symptom and the fix can be reproduced on demand.
- Run on Windows PowerShell 5.1 and PowerShell 7 with nothing but the module
  installed.

## Commands

| Command            | Behaviour                                          |
| ------------------ | -------------------------------------------------- |
| `Get-KanaLock`     | `$true` when kana lock is on                       |
| `Enable-KanaLock`  | Sends one kana key press when off; else nothing    |
| `Disable-KanaLock` | Sends one kana key press when on; else nothing     |

## Non-goals

- **Other toggle keys (Caps Lock, Num Lock, Scroll Lock).** Every keyboard has
  a physical key for them, so they are never stuck, and PowerShell already
  reads them (`[Console]::CapsLock`, `[Console]::NumberLock`). The module name
  is permanent on the PowerShell Gallery; covering them would make `KanaLock`
  misname its contents. A general toggle-key module would be a separate module
  under its own name.
- **IME conversion mode.** Hiragana / katakana / alphanumeric input modes are
  the IME's state, not a keyboard toggle, and the IME already shows and
  switches them.
- **Non-Windows hosts.** The state lives in user32.

## Constraints

- The native calls ship as a prebuilt `netstandard2.0` assembly. Compiling
  them on the user's machine at first use (`Add-Type`) costs about 0.9 s and
  needs a cache, which races between shells started together and can be left
  stale or broken.
- The key state is that of the interactive desktop. Behaviour in session 0
  (services, scheduled tasks, CI runners) is unspecified; `Get-KanaLock` is
  expected to read `$false` there and key presses to go nowhere.
