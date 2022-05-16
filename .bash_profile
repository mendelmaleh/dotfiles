# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

# wayland
if [ "$(tty)" = "/dev/tty1" ]; then
    # colors
    black=#161821
    red=#e27878
    green=#b4be82
    yellow=#e2a478
    blue=#84a0c6
    purple=#a093c7
    cyan=#89b8c2
    white=#c6c8d1
    gray=#8388a388

    export BEMENU_OPTS="--fn 'Dejavu Sans Mono 15px'
        --tb=$green --tf=$black
        --fb=$black --ff=$white
        --hb=$gray --hf=$white
        --nb=$black --nf=$white"

    export MOZ_DBUS_REMOTE=1
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM=wayland-egl

    # start sway
    exec dbus-run-session sway > ~/.local/sway.log 2>&1
fi
