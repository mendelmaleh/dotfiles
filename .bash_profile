# /etc/skel/.bash_profile

if [[ -f ~/.env ]] ; then
	. ~/.env
fi

# brew bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

# wayland
if [ "$(tty)" = "/dev/tty1" ]; then
    export MOZ_DBUS_REMOTE=1
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM=wayland-egl

    # start sway
    exec dbus-run-session sway > ~/.local/sway.log 2>&1
fi
