resource "yandex_container_registry" "default" {
  name      = "container-registry"
  folder_id = yandex_resourcemanager_folder.this.id

  labels = local.labels
}
