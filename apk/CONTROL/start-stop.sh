#!/usr/bin/env sh
#
APKG_PKG_NAME=cappysan-jellyfin
APKG_PKG_SHORT_NAME="${APKG_PKG_NAME#*-}"
APKG_PKG_DIR=/usr/local/AppCentral/${APKG_PKG_NAME}

cd ${APKG_PKG_DIR} || exit 1

export JELLYFIN_CFG_DIR=/share/Configuration/jellyfin/
export JELLYFIN_CACHE_DIR=${JELLYFIN_CFG_DIR}/cache/
export JELLYFIN_DATA_DIR=${JELLYFIN_CFG_DIR}/data/
export JELLYFIN_LOG_DIR=${JELLYFIN_CFG_DIR}/logs/

if test -f /share/Configuration/${APKG_PKG_SHORT_NAME}/env; then
  source /share/Configuration/${APKG_PKG_SHORT_NAME}/env
fi
export HOME=/share/Configuration/${APKG_PKG_SHORT_NAME}
export PID_FILE=/var/run/${APKG_PKG_SHORT_NAME}.pid


case $1 in
  start)
    # Clear the remux logs
    rm -f "${JELLYFIN_LOG_DIR:-/nonexistent}"/FFmpeg.Remux-*.log
    start-stop-daemon -S -b -m -p ${PID_FILE} -c jellyfin:nogroup -x ./jellyfin/jellyfin
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
