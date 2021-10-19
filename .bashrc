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
    # use tilde for $HOME
    path=${1/#$HOME/\~}

    # split by /
    IFS='/' read -ra parts <<< ${path}
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

GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"

PS1='\[${GREEN}\]\h\[${RESET}\] $(dirtrim $PWD) \$ '
