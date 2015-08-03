#!/bin/sh

set -o errexit
set -o nounset

if [ "${1:-}" = "build" ]; then
  touch "/dist/.${2}"
  cd ~/build
  git clone "https://github.com/droboports/${2}.git"
  cd "${2}"
  export GOPATH="/mnt/DroboFS/Shares/DroboApps/${2}"
  ./build.sh
  cp *.tgz /dist/
  rm -f "/dist/.${2}"
elif [ -z "${1:-}" ]; then
  echo "Don't forget to export GOPATH=/mnt/DroboFS/Shares/DroboApps/<app_name> !"
  exec /bin/bash
else
  exec "$@"
fi
