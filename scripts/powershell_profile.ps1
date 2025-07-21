#
# Set the default start-up location.
#
$coding_path = Join-Path -Path $HOME -ChildPath "Coding"
if ( -Not (Test-Path $coding_path) )
{
     New-Item -ItemType Directory -Path $coding_path
}
Set-Location $coding_path

#
# Load the posh-git module.
#
Import-Module posh-git

#
# Set some commonly used aliases.
#
Set-Alias -Name "vi" -Value nvim
Set-Alias -Name "vim" -Value nvim

Function GITSTATUS {git status}
Function GITDIFF {git diff}
Set-Alias -Name "gits" -Value GITSTATUS
Set-Alias -Name "gitd" -Value GITDIFF

Set-Alias -Name "python3" -Value python

# Allow using `refreshenv` command.
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
