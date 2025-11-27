#!/usr/bin/env sh
#

case $1 in
	start|restart)
		true
		;;

	stop)
		true
		;;

	*)
		echo "usage: $0 {start|stop|restart}"
		exit 1
		;;

esac
exit 0
