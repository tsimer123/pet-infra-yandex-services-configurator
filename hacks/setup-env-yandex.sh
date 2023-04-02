#!/bin/bash

cloud_id=b1g4vva7tlne0vi7o5v2
folder_id=b1gc4icvp3odr1k2i4pi

yc init --cloud-id=${cloud_id} --folder-id=${folder_id}

yc kms symmetric-crypto decrypt --id abjtocvapv6bm7q23lk6 --ciphertext-file ./hacks/cipher-secret-key --plaintext-file ./yc-secret-key
yc kms symmetric-crypto decrypt --id abjtocvapv6bm7q23lk6 --ciphertext-file ./hacks/cipher-access-key --plaintext-file ./yc-access-key

cat <<EOF >>./.env
YC_STORAGE_ACCESS_KEY=$(cat ./yc-access-key)
YC_STORAGE_SECRET_KEY=$(cat ./yc-secret-key)
YC_CLOUD_ID=${cloud_id}
YC_FOLDER_ID=${folder_id}
YC_TOKEN=$(yc iam create-token)
EOF

rm -f ./yc-secret-key
rm -f ./yc-access-key
