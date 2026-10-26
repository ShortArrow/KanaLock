using System.Management.Automation;

namespace KanaLock;

/// <summary>
/// Enable-KanaLock: turns kana lock on by sending one kana key press;
/// does nothing when it is already on.
/// </summary>
[Cmdlet(VerbsLifecycle.Enable, "KanaLock")]
public sealed class EnableKanaLockCommand : PSCmdlet
{
    /// <inheritdoc />
    protected override void EndProcessing()
    {
        if (!KeyState.IsKanaLockOn()) KeyState.PressKana();
    }
}
