#
# ~/.zprofile
#

if [[ "$(tty)" == "/dev/tty1" && -z "$DISPLAY" ]]; then
	if uwsm check may-start; then
		exec uwsm start hyprland-uwsm.desktop
	fi
fi

