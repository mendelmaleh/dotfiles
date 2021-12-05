# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

set -o vi

# function to trim dir names
dirtrim() {
    # split by /
    IFS='/' read -ra parts <<< "$1"
    len=${#parts[@]}

    # print dirs
    if (( $len > 1 )); then
        for i in "${parts[@]:0:$len-1}"; do
            # print first char, or two when dir starts with a period
            if [[ "${i:0:1}" != . ]]; then
                printf "${i:0:1}/"
            else
                printf "${i:0:2}/"
            fi
        done
    fi

    # print last dir or slash if empty (root folder)
    if (( $len > 0 )); then
        printf "${parts[$len-1]:-/}"
    fi
}

# ways to get pwd with tilde:
# 1. ${PWD/#$HOME/\~}
# 2. p='\w' echo ${p@P}
# 3. dirs +0

# (1) has an edge case with other user folders that start with the same name,
# could be solved with some sort of lookahead. (2) is ugly as it requires a var
# for the string. (3) requires a subshell, should benchmark eventually.

PS1='\[\033[32m\]\h\[\033[00m\] $(dirtrim "$(dirs +0)") \$ '
