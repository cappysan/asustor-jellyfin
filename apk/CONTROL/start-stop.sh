#!/usr/bin/env sh
#
cd /usr/local/AppCentral/cappysan-jellyfin

export JELLYFIN_CONFIG_DIR=/share/Configuration/jellyfin/
export JELLYFIN_CACHE_DIR=${JELLYFIN_CONFIG_DIR}/cache/
export JELLYFIN_DATA_DIR=${JELLYFIN_CONFIG_DIR}/data/
export JELLYFIN_LOG_DIR=${JELLYFIN_CONFIG_DIR}/logs/
export HOME=${JELLYFIN_CONFIG_DIR}

if test -f /share/Configuration/jellyfin/env; then
  source /share/Configuration/jellyfin/env
fi

export PID_FILE=/var/run/jellyfin.pid

case $1 in
  start)
    # Clear the remux logs
    rm -f "${JELLYFIN_LOG_DIR:-/nonexistent}"/FFmpeg.Remux-*.log
    start-stop-daemon -S -b -m -p ${PID_FILE} -c jellyfin:nogroup -x ./jellyfin/jellyfin "./jellyfin/jellyfin"
    ;;

  stop)
    if test -f ${PID_FILE}; then
      start-stop-daemon -K -p ${PID_FILE}
      rm -f ${PID_FILE}
    fi
    ;;

  restart)
    ${0} stop
    ${0} start
    ;;

  *)
    echo "usage: $0 {start|stop|restart}"
    exit 1
    ;;

esac
exit 0
