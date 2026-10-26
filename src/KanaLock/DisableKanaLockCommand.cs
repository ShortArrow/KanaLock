using System.Management.Automation;

namespace KanaLock;

/// <summary>
/// Disable-KanaLock: turns kana lock off by sending one kana key press;
/// does nothing when it is already off.
/// </summary>
[Cmdlet(VerbsLifecycle.Disable, "KanaLock")]
public sealed class DisableKanaLockCommand : PSCmdlet
{
    /// <inheritdoc />
    protected override void EndProcessing()
    {
        if (KeyState.IsKanaLockOn()) KeyState.PressKana();
    }
}
