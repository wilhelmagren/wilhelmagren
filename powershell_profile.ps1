$shell = $Host.UI.RawUI
$shell.WindowTitle = "PowerShell"

# Set the default locaiton.
Set-Location C:\Users\wille\Coding

# Load the posh-git module.
Import-Module posh-git

# Set some commonly aliases.
Set-Alias vi nvim
Set-Alias vim nvim

Function GITSTATUS {git status}
Function GITDIFF {git diff}
Set-Alias -Name gits -Value GITSTATUS
Set-Alias -Name gitd -Value GITDIFF

Set-Alias py python
