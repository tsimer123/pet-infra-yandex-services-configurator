variable "resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = optional(number)
  })
  description = "Compute resources that are allocated for the instance. The structure is documented below."
}

variable "boot_disk" {
  type = object({
    params = optional(object({
      auto_delete = optional(bool)
      device_name = optional(string)
      mode        = optional(string)
    }))
    values = object({
      name        = optional(string)
      description = optional(string)
      size        = optional(number)
      block_size  = optional(number)
      type        = optional(string)
      family      = optional(string)
      snapshot_id = optional(string)
      disk_placement_policy = optional(object({
        disk_placement_group_id = optional(string)
      }))
    })
  })
  description = "The boot disk for the instance. The structure is documented below."
}

variable "network_interface" {
  type = object({
    subnet_id          = string
    ipv4               = optional(bool)
    ip_address         = optional(string)
    ipv6               = optional(bool)
    ipv6_address       = optional(string)
    nat                = optional(bool)
    nat_ip_address     = optional(string)
    security_group_ids = optional(list(string))
    dns_record = optional(object({
      fqdn        = string
      dns_zone_id = optional(string)
      ttl         = optional(number)
      ptr         = optional(string)
    }))
    ipv6_dns_record = optional(object({
      fqdn        = string
      dns_zone_id = optional(string)
      ttl         = optional(number)
      ptr         = optional(string)
    }))
    nat_dns_record = optional(object({
      fqdn        = string
      dns_zone_id = optional(string)
      ttl         = optional(number)
      ptr         = optional(string)
    }))
  })
  description = "Networks to attach to the instance. This can be specified multiple times. The structure is documented below."
}

variable "folder_id" {
  type        = string
  description = "The ID of the folder that the resource belongs to. If it is not provided, the default provider folder is used."
}

variable "secondary_disk" {
  type = map(object({
    params = optional(object({
      auto_delete = optional(bool)
      device_name = optional(string)
      mode        = optional(string)
    }))
    values = object({
      name        = optional(string)
      description = optional(string)
      size        = optional(number)
      block_size  = optional(number)
      type        = optional(string)
      snapshot_id = optional(string)
      disk_placement_policy = optional(object({
        disk_placement_group_id = optional(string)
      }))
    })
  }))
  description = "A list of disks to attach to the instance."
  default     = {}
}

variable "scheduling_policy" {
  type = object({
    preemptible = optional(string)
  })
  description = "Scheduling policy configuration. The structure is documented below."
  default     = null
}

variable "placement_policy" {
  type = object({
    placement_group_id = optional(string)
    host_affinity_rules = optional(list(object({
      key    = string
      op     = string
      values = list(string)
    })))
  })
  description = "The placement policy configuration. The structure is documented below."
  default     = null
}

variable "local_disk" {
  type = object({
    size_bytes = optional(list(number))
  })
  description = "List of local disks that are attached to the instance. Structure is documented below."
  default     = null
}

variable "name" {
  type        = string
  description = "Resource name."
  default     = ""
}

variable "description" {
  type        = string
  description = "Description of the instance."
  default     = ""
}

variable "zone" {
  type        = string
  description = "The availability zone where the virtual machine will be created. If it is not provided, the default provider folder is used."
  default     = "ru-central1-b"
}

variable "hostname" {
  type        = string
  description = "Host name for the instance."
  default     = ""
}

variable "metadata" {
  type        = map(any)
  description = "Metadata key/value pairs to make available from within the instance."
  default     = {}
}

variable "platform_id" {
  type        = string
  description = "The type of virtual machine to create. The default is 'standard-v1'."
  default     = "standard-v1"
}

variable "service_account_id" {
  type        = string
  description = "ID of the service account authorized for this instance."
  default     = ""
}

variable "allow_stopping_for_update" {
  type        = bool
  description = "If true, allows Terraform to stop the instance in order to update its properties. If you try to update a property that requires stopping the instance without setting this field, the update will fail."
  default     = false
}

variable "network_acceleration_type" {
  type        = string
  description = "Type of network acceleration. The default is standard. Values: standard, software_accelerated."
  default     = "standard"
}
