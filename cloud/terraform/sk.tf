resource "yandex_kms_symmetric_key" "this" {
  folder_id   = yandex_resourcemanager_folder.this.id
  name        = "sk_terraform"
  description = "Symmetric key for terraform"

  labels = local.labels
}
