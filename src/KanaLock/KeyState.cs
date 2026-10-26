using System;
using System.Runtime.InteropServices;

namespace KanaLock;

/// <summary>
/// The kana lock (VK_KANA) toggle as user32 reports and changes it.
/// </summary>
/// <remarks>
/// With kana lock on, a field that turns the IME off (a password field,
/// pinentry) receives letters as half-width kana from the JIS kana layout,
/// whatever mode the IME shows. A 101-key keyboard has no kana key to clear
/// it by hand.
/// </remarks>
public static class KeyState
{
    private const int VkKana = 0x15;
    private const uint KeyEventKeyUp = 0x0002;

    /// <summary>True when a GetKeyState result has its toggle bit (low bit) set.</summary>
    public static bool IsToggled(short state) => (state & 1) != 0;

    /// <summary>True when kana lock is on.</summary>
    public static bool IsKanaLockOn() => IsToggled(GetKeyState(VkKana));

    /// <summary>Sends one kana key press, which flips kana lock.</summary>
    public static void PressKana()
    {
        keybd_event(VkKana, 0, 0, UIntPtr.Zero);
        keybd_event(VkKana, 0, KeyEventKeyUp, UIntPtr.Zero);
    }

    [DllImport("user32.dll")]
    private static extern short GetKeyState(int vKey);

    [DllImport("user32.dll")]
    private static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo);
}
