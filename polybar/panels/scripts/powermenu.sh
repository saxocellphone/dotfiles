#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

DIR="$HOME/.config/polybar/panels/menu"
uptime=$(uptime -p | sed -e 's/up //g')

if  [[ "$1" = "--budgie" ]]; then
	theme="budgie"

elif  [[ "$1" = "--deepin" ]]; then
	theme="deepin"

elif  [[ "$1" = "--elight" ]]; then
	theme="elementary"

elif  [[ "$1" = "--edark" ]]; then
	theme="elementary_dark"

elif  [[ "$1" = "--gnome" ]]; then
	theme="gnome"

elif  [[ "$1" = "--klight" ]]; then
	theme="kde"

elif  [[ "$1" = "--kdark" ]]; then
	theme="kde_dark"

elif  [[ "$1" = "--liri" ]]; then
	theme="liri"

elif  [[ "$1" = "--mint" ]]; then
	theme="mint"

elif  [[ "$1" = "--ugnome" ]]; then
	theme="ubuntu_gnome"

elif  [[ "$1" = "--unity" ]]; then
	theme="ubuntu_unity"

elif  [[ "$1" = "--xubuntu" ]]; then
	theme="xubuntu"

elif  [[ "$1" = "--zorin" ]]; then
	theme="zorin"

else
	rofi -e "No theme specified."
	exit 1
fi

rofi_command="rofi -theme $DIR/$theme/powermenu.rasi"

# Options
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
suspend=" Sleep"
logout=" Logout"

# Confirmation
confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Are You Sure? : "\
		-theme $DIR/$theme/confirm.rasi
}

# Message
msg() {
	rofi -theme "$DIR/$theme/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
	systemctl poweroff
        ;;
    $reboot)
	systemctl reboot
        ;;
    $lock)
	if [[ -f /usr/bin/betterlockscreen ]]; then
		betterlockscreen -l
	elif [[ -f /usr/bin/i3lock ]]; then
		i3lock
	fi
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
	if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
		openbox --exit
	elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
		bspc quit
	elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
		i3-msg exit
	fi
        ;;
esac
