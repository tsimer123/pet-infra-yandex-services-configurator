module "this" {
  source = "../../modules/compute"

  folder_id   = yandex_resourcemanager_folder.this.id
  name        = "atlantis"
  description = "Atlantis worker"
  zone        = local.zone
  platform_id = "standard-v1"
  resources = {
    cores  = 1
    memory = 1
  }
  boot_disk = {
    params = {
      auto_delete = true
      device_name = "system"
    }
    values = {
      name   = "system"
      size   = 15
      type   = "network-hdd"
      family = "ubuntu-2204-lts"
    }
  }
  network_interface = {
    subnet_id      = data.yandex_vpc_subnet.a_compute.subnet_id
    nat            = true
    nat_ip_address = yandex_vpc_address.this.external_ipv4_address[0].address
  }
  metadata = {
    user-data = templatefile("${path.module}/templates/init.tpl", {})
  }
}
