resource "yandex_compute_instance" "this" {
  resources {
    cores         = var.resources.cores
    memory        = var.resources.memory
    core_fraction = var.resources.core_fraction
  }

  boot_disk {
    disk_id     = yandex_compute_disk.boot.id
    auto_delete = var.boot_disk.params.auto_delete
    device_name = var.boot_disk.params.device_name
    mode        = var.boot_disk.params.mode
  }

  network_interface {
    subnet_id          = var.network_interface.subnet_id
    ipv4               = var.network_interface.ipv4
    ip_address         = var.network_interface.ip_address
    ipv6               = var.network_interface.ipv6
    ipv6_address       = var.network_interface.ipv6_address
    nat                = var.network_interface.nat
    nat_ip_address     = var.network_interface.nat_ip_address
    security_group_ids = var.network_interface.security_group_ids
    dynamic "dns_record" {
      for_each = var.network_interface.dns_record == null ? [] : [var.network_interface.dns_record]
      content {
        fqdn        = dns_record.value.fqdn
        dns_zone_id = dns_record.value.dns_zone_id
        ttl         = dns_record.value.ttl
        ptr         = dns_record.value.ptr
      }
    }
    dynamic "ipv6_dns_record" {
      for_each = var.network_interface.ipv6_dns_record == null ? [] : [var.network_interface.ipv6_dns_record]
      content {
        fqdn        = ipv6_dns_record.value.fqdn
        dns_zone_id = ipv6_dns_record.value.dns_zone_id
        ttl         = ipv6_dns_record.value.ttl
        ptr         = ipv6_dns_record.value.ptr
      }
    }
    dynamic "nat_dns_record" {
      for_each = var.network_interface.nat_dns_record == null ? [] : [var.network_interface.nat_dns_record]
      content {
        fqdn        = nat_dns_record.value.fqdn
        dns_zone_id = nat_dns_record.value.dns_zone_id
        ttl         = nat_dns_record.value.ttl
        ptr         = nat_dns_record.value.ptr
      }
    }
  }
  folder_id = var.folder_id

  dynamic "secondary_disk" {
    for_each = var.secondary_disk
    content {
      disk_id     = yandex_compute_disk.additional[secondary_disk.key]
      auto_delete = secondary_disk.value.auto_delete
      device_name = secondary_disk.value.device_name
      mode        = secondary_disk.value.mode
    }
  }

  dynamic "scheduling_policy" {
    for_each = var.scheduling_policy == null ? [] : [var.scheduling_policy]
    content {
      preemptible = scheduling_policy.value.preemptible
    }
  }

  dynamic "placement_policy" {
    for_each = var.placement_policy == null ? [] : [var.placement_policy]
    content {
      placement_group_id = placement_policy.value.placement_group_id
      dynamic "host_affinity_rules" {
        for_each = placement_policy.value.host_affinity_rules == null ? [] : [placement_policy.value.host_affinity_rules]
        content {
          key    = host_affinity_rules.value.key
          op     = host_affinity_rules.value.op
          values = host_affinity_rules.value.values
        }
      }
    }
  }

  dynamic "local_disk" {
    for_each = var.local_disk == null ? [] : [var.local_disk]
    content {
      size_bytes = local_disk.value.size_bytes
    }
  }

  name                      = var.name
  description               = var.description
  zone                      = var.zone
  hostname                  = var.hostname
  metadata                  = var.metadata
  platform_id               = var.platform_id
  service_account_id        = var.service_account_id
  allow_stopping_for_update = var.allow_stopping_for_update
  network_acceleration_type = var.network_acceleration_type

  labels = local.default_labels
}
