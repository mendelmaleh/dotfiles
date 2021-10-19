# /etc/skel/.bash_profile

PATH=~/bin:~/go/bin:$PATH

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi
