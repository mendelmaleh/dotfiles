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

    if test -z "${XDG_RUNTIME_DIR}"; then
	    export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
	    if ! test -d "${XDG_RUNTIME_DIR}"; then
		    mkdir "${XDG_RUNTIME_DIR}"
		    chmod 0700 "${XDG_RUNTIME_DIR}"
	    fi
    fi

    # start sway
    exec dbus-run-session sway > ~/.local/sway.log 2>&1
fi
