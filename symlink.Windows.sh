#!/bin/sh
cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        mklink /D  "$PWD/$dotfile" "$HOME/$dotfile"
    fi
done

