#!/bin/bash

cloud_id=b1g4vva7tlne0vi7o5v2
folder_id=b1gc4icvp3odr1k2i4pi
terraform_state_keys_secret_id=e6qta9bg4j4qgc55t693

yc init --cloud-id=${cloud_id} --folder-id=${folder_id}

IAM_TOKEN=$(yc iam create-token)

cat <<EOF >>./.env
YC_STORAGE_ACCESS_KEY=$(curl -X GET -s \
    -H "Authorization: Bearer ${IAM_TOKEN}" \
    https://payload.lockbox.api.cloud.yandex.net/lockbox/v1/secrets/${terraform_state_keys_secret_id}/payload | jq -r .entries[0].textValue)
YC_STORAGE_SECRET_KEY=$(curl -X GET -s \
        -H "Authorization: Bearer ${IAM_TOKEN}" \
        https://payload.lockbox.api.cloud.yandex.net/lockbox/v1/secrets/${terraform_state_keys_secret_id}/payload | jq -r .entries[1].textValue)
YC_CLOUD_ID=${cloud_id}
YC_FOLDER_ID=${folder_id}
YC_TOKEN=${IAM_TOKEN}
EOF
