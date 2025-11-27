#!/usr/bin/env sh
#
# Ensure permissions limit to root user.
chown -R 0:0 ${APKG_PKG_DIR}

mkdir -pv ${APKG_PKG_DIR}
touch ${APKG_PKG_DIR}/install || true
