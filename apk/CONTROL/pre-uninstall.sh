#!/usr/bin/env sh
#
# Before deleting the user, we must change permissions to root.
#
APKG_PKG_SHORT_NAME=cappysan-jellyfin
APKG_PKG_SHORT_NAME="${APKG_PKG_NAME#*-}"
APKG_CFG_DIR=/share/Configuration/${APKG_PKG_SHORT_NAME}

chown -R root:root ${APKG_CFG_DIR}
userdel ${APKG_PKG_SHORT_NAME}

exit 0
