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
	  --expand true --width 10 --transparent true --tint 0x191970 --height 17 &
 xsetroot -cursor_name left_ptr
 #xsetroot -solid midnightblue
 xloadimage -onroot -fullscreen Desktop/0e2442a7d933c895362fae38d11373f08202001b.jpg
 xscreensaver -no-splash &
 xset -b
 if [ -x /usr/bin/nm-applet ] ; then
    nm-applet --sm-disable &
 fi
 ibus-daemon -d --xim
 # start xmonad
 exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xmonad
 
