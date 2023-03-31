#!/bin/bash

# expect the following env vars from atlantis:
#
# * BASE_REPO_OWNER
# * BASE_REPO_NAME
#
# and env var with storage account configuration
#
# * YC_STORAGE_ACCESS_KEY
# * YC_STORAGE_SECRET_KEY

[ $# -lt 1 ] && echo "Usage: $(basename $0) <project dir>" && exit 1

PROJECT_DIR="${1}"
if [ "${PROJECT_DIR}" == "." ]; then
  echo "[E] project directory should not be root of repo"
  exit 1
fi

cat <<EOF >./__autogen_backend.tf
terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "ts-mr-terraform"
    region     = "ru-central1"
    key        = "${BASE_REPO_OWNER}/${BASE_REPO_NAME}/${PROJECT_DIR}"
    access_key = "${YC_STORAGE_ACCESS_KEY}"
    secret_key = "${YC_STORAGE_SECRET_KEY}"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
EOF
