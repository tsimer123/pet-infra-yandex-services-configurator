resource "yandex_vpc_network" "this" {
  folder_id = yandex_resourcemanager_folder.this.id
  name      = "Main"

  labels = local.labels
}
