resource "yandex_kms_symmetric_key" "this" {
  folder_id         = yandex_resourcemanager_folder.this.id
  name              = "kube-cypher-key"
  description       = "Encryption/Decryption key for managed k8s clusters"
  default_algorithm = "AES_256"
  rotation_period   = "8760h"

  labels = local.labels
}
