#!/bin/bash

SCRIPT_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
    pwd
)"

trap echo '[.]' exit

echo "[~] Setup base"
cat <<EOF >./.env
BASE_REPO_OWNER=windemiatrix
BASE_REPO_NAME=infra-terraform
EOF

echo "[~] Setup yandex env"
"${SCRIPT_DIR}/setup-env-yandex.sh"
