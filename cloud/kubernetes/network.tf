data "yandex_vpc_network" "this" {
  name      = "Main"
  folder_id = data.yandex_resourcemanager_folder.network.folder_id
}

data "yandex_vpc_subnet" "kube" {
  name      = "${local.zone}-kube"
  folder_id = data.yandex_resourcemanager_folder.network.folder_id
}

