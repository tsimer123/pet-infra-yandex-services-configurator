#!/bin/bash

set -e

[ $# -lt 1 ] && echo "Usage: $(basename $0) <project dir>" && exit 1

PROJECT_DIR="${1}"
if [ "${PROJECT_DIR}" == "." ]; then
    echo "[E] project directory should not be root of repo"
    exit 1
fi

if [[ "${PROJECT_DIR}" =~ ^/.* ]]; then
    echo "[E] project directory should be defined as relative path"
    exit 1
fi

SCRIPT_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
    pwd
)"

CWD=$(pwd)
PROJECT_REL_PATH=$(realpath --relative-to="${CWD}" "${PROJECT_DIR}")

echo "${PROJECT_REL_PATH}" | grep -q 'azure' && (
    if [[ $(az account list --only-show-errors | jq length) == 0 ]]; then
        az login -o none
    fi
)

cd "${PROJECT_REL_PATH}"
rm -rf .terraform __autogen_backend.tf .terraform.lock.hcl
"${SCRIPT_DIR}/auto-backend.sh" "${PROJECT_REL_PATH}"

terraform init
