#!/usr/bin/env bash
#===============================================================================
#
# NAME
#       update.sh
#
# SYNOPSIS
#       ./update.sh [repository's directory]
#
# DESCRIPTION
#       Update submodules and main project from remote git repository
#       
# COPYRIGHT AND LICENSE
#       Copyright © 2014- Piotr Roogża. License MIT
#
# AUTHOR
#       Piotr Roogża (dracorp), rogoza dot piotr at gmail dot com
#
# CREATED
#       28.03.2014 11:04
#===============================================================================

REMOTE='https://github.com/dracorp/various-scripts.git'
REPOSITORY=various-scripts

if [ -d "$1" ]; then
    cd "$1"
else 
    cd $(dirname $0)
fi

_update_repo(){ #{{{
    git pull
    git submodule init
    git submodule update
    echo "Updating done."
} #}}}

if [ -d various-scripts ]; then 
    cd $REPOSITORY
    if [ -d .git ]; then
        _update_repo
    else
        echo "Missing a .git directory. Do you already cloned the repository?"
        exit 1
    fi
elif [ -d .git ]; then
    _update_repo
else
    echo "Missing repository directory: $REPOSITORY. Do you already cloned the repository?"
    exit 1
fi
