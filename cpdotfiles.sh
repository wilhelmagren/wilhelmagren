#!/bin/bash

files=(.vimrc .tmux.conf .bashrc .bash_aliases)
RED="\e[1;31m"
GREEN="\e[1;32m"
ENDCOLOR="\e[0m"

printf "${GREEN}[*]${ENDCOLOR}  Copying dotfiles to $HOME\n"

for file in "${files[@]}" ; do
    if [ -f "$file" ] ; then
        cp $file $HOME/$file
    else
        printf "${RED}[!]${ENDCOLOR}  could not find $file file...\n"
    fi
done
