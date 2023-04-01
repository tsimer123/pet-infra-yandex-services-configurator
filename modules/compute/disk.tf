data "yandex_compute_image" "this" {
  family = var.boot_disk.values.family
}

resource "yandex_compute_disk" "boot" {
  name        = var.boot_disk.values.name
  description = var.boot_disk.values.description
  size        = var.boot_disk.values.size
  block_size  = var.boot_disk.values.block_size
  type        = var.boot_disk.values.type
  dynamic "disk_placement_policy" {
    for_each = var.boot_disk.values.disk_placement_policy == null ? [] : [var.boot_disk.values.disk_placement_policy]
    content {
      disk_placement_group_id = disk_placement_policy.value.disk_placement_group_id
    }
  }
  image_id    = data.yandex_compute_image.this.id
  snapshot_id = var.boot_disk.values.snapshot_id
  folder_id   = var.folder_id
  zone        = var.zone

  labels = local.default_labels
}

resource "yandex_compute_disk" "additional" {
  for_each = var.secondary_disk

  name        = each.value.name
  description = each.value.description
  size        = each.value.size
  block_size  = each.value.block_size
  type        = each.value.type
  dynamic "disk_placement_policy" {
    for_each = each.value.disk_placement_policy == null ? [] : [each.value.disk_placement_policy]
    content {
      disk_placement_group_id = disk_placement_policy.value.disk_placement_group_id
    }
  }
  snapshot_id = each.value.snapshot_id
  folder_id   = var.folder_id
  zone        = var.zone

  labels = local.default_labels
}
