#!/usr/bin/env sh
#
cd /usr/local/AppCentral/cappysan-jellyfin

export JELLYFIN_CONFIG_DIR=/share/Configuration/jellyfin/
export JELLYFIN_CACHE_DIR=${JELLYFIN_CONFIG_DIR}/cache/
export JELLYFIN_DATA_DIR=${JELLYFIN_CONFIG_DIR}/data/

if test -f /share/Configuration/jellyfin/env; then
  source /share/Configuration/jellyfin/env
fi

case $1 in
  start|restart)
    ./CONTROL/install.sh
    start-stop-daemon -S -b -p /tmp/jellyfin.pid -x ./jellyfin/jellyfin
    ;;

  stop)
    start-stop-daemon -K -x ./jellyfin/jellyfin
    ;;

  *)
    echo "usage: $0 {start|stop|restart}"
    exit 1
    ;;

esac
exit 0
