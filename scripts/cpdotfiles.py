#!/usr/bin/python3
import sys
import os
import shutil
from pathlib import Path

expected = [".bash_aliases", ".bashrc", ".tmux.conf", ".vimrc", ".config"]

rootdir = Path(os.getcwd())
homedir = Path.home()
dotfiles = [Path(f) for f in os.listdir(rootdir) if (f[0] == ".")]

for dfile in dotfiles:
    if dfile.is_file() or dfile.is_dir():
        if str(dfile) not in expected:
            sys.stdout.write(f"! found unexpected file: {dfile}\n")
            answer = input("copy file anyway?: [y/N] ")
            if answer not in ["y", "Y"]:
                continue

        sys.stdout.write(f"Copying {dfile}\n")
        if dfile.is_file():
            new_path = homedir / dfile
            shutil.copy(rootdir / dfile, new_path)
        if dfile.is_dir():
            new_path = homedir / dfile
            shutil.copytree(rootdir / dfile, new_path, dirs_exist_ok=True)

sys.stdout.write(f"All done!\n")
