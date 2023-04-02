resource "yandex_vpc_address" "this" {
  name        = "atlantis"
  description = "Public IP address for Atlantis runner"
  folder_id   = data.yandex_resourcemanager_folder.network.id

  external_ipv4_address {
    zone_id                  = local.zone
    ddos_protection_provider = "qrator"
  }

  labels = local.labels
}
