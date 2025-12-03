#!/usr/bin/env sh
#
# Ensure permissions limit to root user.
chown -R 0:0 ${APKG_PKG_DIR}

# Copy available configurations
mkdir -pv /share/Configuration/jellyfin/
mv -nv ${APKG_PKG_DIR}/env /share/Configuration/jellyfin/
exit 0
