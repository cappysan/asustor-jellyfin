#!/usr/bin/env sh
#
set -eu

APKG_PKG_VER="10.11.3-r1"
APKG_PKG_DIR=/usr/local/AppCentral/cappysan-jellyfin

cd "${APKG_PKG_DIR}"

if test ! -f ./jellyfin/jellyfin; then
  true
elif test ! -f install; then
  exit 0
fi

wget "https://repo.jellyfin.org/files/server/linux/stable/v${APKG_PKG_VER%-*}/amd64/jellyfin_${APKG_PKG_VER%-*}-amd64.tar.xz" -O /tmp/jellyfin.tar.xz
rm -fr "${APKG_PKG_DIR}/jellyfin" || true
tar -xf /tmp/jellyfin.tar.xz -C "${APKG_PKG_DIR}"/

rm -f ${APKG_PKG_DIR}/install || true
