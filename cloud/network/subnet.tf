resource "yandex_vpc_subnet" "a_compute" {
  name           = "${local.zone}-compute"
  folder_id      = yandex_resourcemanager_folder.this.id
  zone           = local.zone
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = ["10.5.0.0/24"]
}
