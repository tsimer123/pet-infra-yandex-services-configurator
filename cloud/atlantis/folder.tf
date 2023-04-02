resource "yandex_resourcemanager_folder" "this" {
  cloud_id    = local.cloud_id
  name        = "atlantis"
  description = "Atlantis resources"

  labels = local.labels
}

data "yandex_resourcemanager_folder" "network" {
  cloud_id = local.cloud_id
  name     = "network"
}
