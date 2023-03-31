resource "yandex_resourcemanager_folder" "this" {
  cloud_id    = local.cloud_id
  name        = "terraform"
  description = "Terraform bucket and symmetric key"

  labels = local.labels
}
