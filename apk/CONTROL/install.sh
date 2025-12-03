#!/usr/bin/env sh
#
set -eu

APKG_PKG_DIR=/usr/local/AppCentral/cappysan-jellyfin
APKG_PKG_VER="$(cat CONTROL/config.json | jq .general.version | xargs)"

cd "${APKG_PKG_DIR}"

if test -f ./jellyfin/jellyfin; then
  exit 0
fi

wget "https://repo.jellyfin.org/files/server/linux/stable/v${APKG_PKG_VER%-*}/amd64/jellyfin_${APKG_PKG_VER%-*}-amd64.tar.xz" -O /tmp/jellyfin.tar.xz
rm -fr "${APKG_PKG_DIR}/jellyfin" || true
tar -xf /tmp/jellyfin.tar.xz -C "${APKG_PKG_DIR}"/

mkdir -pv /share/Configuration/jellyfin
chmod 750 /share/Configuration/jellyfin
cp -n "${APKG_PKG_DIR}/conf.dist/network.xml" /share/Configuration/jellyfin/
