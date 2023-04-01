resource "yandex_resourcemanager_folder" "this" {
  cloud_id    = local.cloud_id
  name        = "network"
  description = "Network definition"

  labels = local.labels
}
