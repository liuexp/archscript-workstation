#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

#-- End of template
#

 trayer --edge top --align right --SetDockType true --SetPartialStrut true \
	  --expand true --width 9  --transparent true --tint 0x444444 --alpha 0 --distance 0 --padding 0 --height 19 &
 xsetroot -cursor_name left_ptr
 xscreensaver -no-splash &
 xset -b
 if [ -x /usr/bin/nm-applet ] ; then
    nm-applet --sm-disable &
 fi
 nitrogen --restore
# /usr/lib/gnome-settings-daemon/gnome-settings-daemon &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
 gnome-sound-applet &
 ibus-daemon -xrd &
 mpd --kill
 mpd &

 # start xmonad
 exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xmonad
 

