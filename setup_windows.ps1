#Requires -RunAsAdministrator

#
# Install `Chocolately` for Individual Use.
# We must ensure `Get-ExecutionPolicy` is not `Restricted`.
#

$executionPolicy = Get-ExecutionPolicy
if ( $executionPolicy == "Restricted" )
{
    Write-Output "ExecutionPolicy was Restricted, changing to AllSigned"
    Set-ExecutionPolicy AllSigned
}

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#
# Install `git` version control.
# Thank you Linus Torvalds.
#
choco install git

#
# Install `posh-git`, the PowerShell environment for git.
# Enables tab-completion and output highlighting.
#
choco install poshgit

#
# Install NeoVim
#
choco install neovim

#
# Install Python3.10.x
#
choco install python3

#
# Set up the PowerShell profile for the current user.
#
$profile_path = $profile
Copy-Item -Path .\powershell_profile.ps1 -Destination $profile_path -Recurse -Force

Write-Output "🌲 Everything should now be set up, please close this shell."
