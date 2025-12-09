#!/usr/bin/env sh
#
# Ensure permissions limit to root user.
chown -R 0:0 ${APKG_PKG_DIR}

# Install product
export APKG_PKG_VER="$(cat ${APKG_PKG_DIR}/CONTROL/config.json | jq .general.version | xargs)"
URL="https://repo.jellyfin.org/files/server/linux/stable/v${APKG_PKG_VER%-*}/amd64/jellyfin_${APKG_PKG_VER%-*}-amd64.tar.xz"
wget --progress none -O /tmp/jellyfin.tar.xz "${URL}"

if test -d "${APKG_PKG_DIR}/jellyfin"; then
  rm -fr "${APKG_PKG_DIR}/jellyfin"
fi  

tar -vxf /tmp/jellyfin.tar.xz -C "${APKG_PKG_DIR}"/
rm /tmp/jellyfin.tar.xz

# Copy available configurations
mkdir -pv /share/Configuration/jellyfin
chmod 750 /share/Configuration/jellyfin
chown -R root:root /share/Configuration/jellyfin

cp -nv ${APKG_PKG_DIR}/conf.dist/env          /share/Configuration/jellyfin/
cp -n "${APKG_PKG_DIR}/conf.dist/network.xml" /share/Configuration/jellyfin/

exit 0
