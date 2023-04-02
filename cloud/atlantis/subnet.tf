data "yandex_vpc_subnet" "a_compute" {
  name      = "${local.zone}-compute"
  folder_id = data.yandex_resourcemanager_folder.network.id
}
