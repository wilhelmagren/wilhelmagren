#Requires -RunAsAdministrator

#
# Install `Chocolately` for Individual Use.
# We must ensure `Get-ExecutionPolicy` is not `Restricted`.
#

$executionPolicy = Get-ExecutionPolicy
if ( $executionPolicy -eq "Restricted" )
{
    Write-Output "ExecutionPolicy was Restricted, changing to AllSigned"
    Set-ExecutionPolicy AllSigned
}

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1

#
# Install `git` version control.
# Thank you Linus Torvalds.
#
choco install git --yes
refreshenv

#
# Install `posh-git`, the PowerShell environment for git.
# Enables tab-completion and output highlighting.
#
choco install poshgit --yes
refreshenv

#
# Install `Neovim`.
#
choco install neovim --yes
refreshenv

#
# Install `Python3.x` (the latest version available),
# and some required libraries+scripts needed later.
#
choco install python3 --yes
refreshenv
python -m pip install virtualenv

#
# Install `LLVM` and `Clang`.
#
choco install llvm --yes
refreshenv

#
# Setup `Neovim`.
# Will require you to open nvim at least once to start
# installing all plugins with `packer` package manager.
#

Copy-Item -Path .\nvim -Destination $env:LOCALAPPDATA -Recurse -Force

#
# Set up the `PowerShell` profile for the current user.
#
Copy-Item -Path .\powershell_profile.ps1 -Destination $profile -Recurse -Force

Write-Output "🌲 Everything should now be set up, please close this shell..."
