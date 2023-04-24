resource "yandex_resourcemanager_folder" "this" {
  cloud_id    = local.cloud_id
  name        = "kubernetes"
  description = "Kubernetes definition"

  labels = local.labels
}

data "yandex_resourcemanager_folder" "network" {
  name = "network"
}
