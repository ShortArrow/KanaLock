using System.Management.Automation;

namespace KanaLock;

/// <summary>Get-KanaLock: writes true when kana lock is on.</summary>
[Cmdlet(VerbsCommon.Get, "KanaLock")]
[OutputType(typeof(bool))]
public sealed class GetKanaLockCommand : PSCmdlet
{
    /// <inheritdoc />
    protected override void EndProcessing() => WriteObject(KeyState.IsKanaLockOn());
}
