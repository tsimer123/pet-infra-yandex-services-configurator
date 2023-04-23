resource "yandex_resourcemanager_folder" "this" {
  cloud_id    = local.cloud_id
  name        = "registry"
  description = "Container registry"

  labels = local.labels
}
