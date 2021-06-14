#!/bin/bash
source="$0"
while [ -h "$source"  ]; do # resolve $source until the file is no longer a symlink
    current_dir="$( cd -P "$( dirname "$source"  )" && pwd  )"
    source="$(readlink "$source")"
    [[ $source != /*  ]] && source="$current_dir/$source" # if $source was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
current_dir="$( cd -P "$( dirname "$source"  )" && pwd  )"

ln -s ${current_dir}/.SpaceVim.d ~/.SpaceVim.d

