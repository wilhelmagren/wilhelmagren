#!/usr/bin/python3
# copy the dotfiles from my profile repository to the home directory
# after this, some things still have to be properly set up:
#   1) vim-plugged
#      - https://github.com/junegunn/vim-plug
#      - curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#
#   2) optionally dracula-theme and powerline for tmux
#      - uuuh
#
import sys
import os
import shutil
from pathlib import Path

expected = ['.bash_aliases', '.bashrc', '.tmux.conf', '.vimrc']

rootdir = Path(os.getcwd())
homedir = Path.home()
dotfiles = [Path(f) for f in os.listdir(rootdir) if (f[0] == '.')]

for dfile in dotfiles:
    if dfile.is_file():
        if str(dfile) not in expected:
            sys.stdout.write(f'! found unexpected file: {dfile}\n')
            answer = input('copy file anyway?: [Y/n] ')
            if answer not in ['y', 'Y']:
                continue

        new_path = homedir/dfile
        shutil.copy(rootdir/dfile, new_path)
        sys.stdout.write(f'Copying {dfile}\n')

sys.stdout.write(f'All done!\n')

