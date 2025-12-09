#!/usr/bin/env sh
#
if test "x${APKG_PKG_DIR}" = x; then
  echo "error: required env var APKG_PKG_DIR not set" >&2
  exit 1
elif test "x${APKG_PKG_NAME}" = x; then
  echo "error: required env var APKG_PKG_NAME not set" >&2
  exit 1
elif test "x${APKG_PKG_VER}" = x; then
  echo "error: required env var APKG_PKG_VER not set" >&2
  exit 1
fi

# Set all variables
APKG_PKG_SHORT_NAME="${APKG_PKG_NAME#*-}"
APKG_PKG_SHORT_VER="${APKG_PKG_VER%-*}"
APKG_CFG_DIR=/share/Configuration/${APKG_PKG_SHORT_NAME}
APKG_TAR_FILE=/tmp/${APKG_PKG_SHORT_NAME}.tar.xz
export APKG_PKG_SHORT_NAME APKG_CFG_DIR APKG_PKG_VER APKG_PKG_SHORT_VER
env | grep APKG > ${APKG_PKG_DIR}/.env.install

# Ensure permissions are limited to root user for the application folder.
chown -R 0:0 ${APKG_PKG_DIR}

# Download application
URL="https://repo.jellyfin.org/files/server/linux/stable/v${APKG_PKG_SHORT_VER}/amd64/jellyfin_${APKG_PKG_SHORT_VER}-amd64.tar.xz"
wget --progress none -O ${APKG_TAR_FILE} "${URL}" || exit 1

# Replace application by new application
if test -d "${APKG_PKG_DIR}/jellyfin"; then
  rm -fr "${APKG_PKG_DIR}/jellyfin"
fi
tar -vxf ${APKG_TAR_FILE} -C "${APKG_PKG_DIR}"/ || exit 1
rm -f ${APKG_TAR_FILE}

# Create a user, and copy no-overwrite the configuration
useradd --system --no-create-home --home-dir ${APKG_CFG_DIR}/ --gid nogroup --shell /bin/false ${APKG_PKG_SHORT_NAME}
mkdir -p ${APKG_CFG_DIR}
rsync -av --inplace --ignore-existing ${APKG_PKG_DIR}/conf.dist/ ${APKG_CFG_DIR}

chown -R ${APKG_PKG_SHORT_NAME}:root ${APKG_CFG_DIR}
chmod 750 ${APKG_CFG_DIR}

# Make a p12 certificate from current certificates
${APKG_PKG_DIR}/renewal-hooks/deploy/jellyfin

exit 0
