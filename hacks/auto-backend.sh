#!/bin/bash

[ $# -lt 1 ] && echo "Usage: $(basename $0) <project dir>" && exit 1

SCRIPT_DIR="$(
  cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
  pwd
)"

PROJECT_DIR="${1}"
if [ "${PROJECT_DIR}" == "." ]; then
  echo "[ERROR] project directory should not be root of repo"
  exit 1
fi

  echo '[INFO] Init yandex backend'
  "${SCRIPT_DIR}/auto-backend-yandex.sh" "${PROJECT_DIR}"
  exit 0
