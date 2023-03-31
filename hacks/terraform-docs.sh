#!/bin/bash

BASE_DIR=$(
    cd "$(dirname $0)" || exit 1
    cd ..
    pwd
)
BASE_DIR_WITH_TRAILING_SLASH="${BASE_DIR}/"
MODULES_DIR="${BASE_DIR}/modules"

ALL='false'
STAGE='true'

while getopts ":a:s:" option; do
    case "${option}" in
    a) ALL=${OPTARG} ;;
    s) STAGE=${OPTARG} ;;
    *) echo "Unknown option ${option}" && exit 1 ;;
    esac
done

[[ "$ALL" = "true" ]] && modules="${MODULES_DIR}/*/*" ||
    modules=$(git diff --staged --diff-filter=ACMR --dirstat=files,0 ${MODULES_DIR} | awk -v BASE_DIR=${BASE_DIR_WITH_TRAILING_SLASH} '{print BASE_DIR$2}')

[ -z "${modules}" ] && echo 'No changes in modules, nothing to generate' && exit 0

for module in ${modules}; do
    echo "Generate new docs for ${module}"

    cd ${module} && terraform init
    terraform-docs md ${module} >"${module}/README.md" && (
        [[ "$STAGE" = "true" ]] && git add "${module}/README.md" || true
    )
done
