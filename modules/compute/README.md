## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.4 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >=0.88.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.88.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_compute_disk.additional](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_disk) | resource |
| [yandex_compute_disk.boot](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_disk) | resource |
| [yandex_compute_instance.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) | resource |
| [yandex_compute_image.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_stopping_for_update"></a> [allow\_stopping\_for\_update](#input\_allow\_stopping\_for\_update) | If true, allows Terraform to stop the instance in order to update its properties. If you try to update a property that requires stopping the instance without setting this field, the update will fail. | `bool` | `false` | no |
| <a name="input_boot_disk"></a> [boot\_disk](#input\_boot\_disk) | The boot disk for the instance. The structure is documented below. | <pre>object({<br>    params = optional(object({<br>      auto_delete = optional(bool)<br>      device_name = optional(string)<br>      mode        = optional(string)<br>    }))<br>    values = object({<br>      name        = optional(string)<br>      description = optional(string)<br>      size        = optional(number)<br>      block_size  = optional(number)<br>      type        = optional(string)<br>      family      = optional(string)<br>      snapshot_id = optional(string)<br>      disk_placement_policy = optional(object({<br>        disk_placement_group_id = optional(string)<br>      }))<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of the instance. | `string` | `""` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of the folder that the resource belongs to. If it is not provided, the default provider folder is used. | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Host name for the instance. | `string` | `""` | no |
| <a name="input_local_disk"></a> [local\_disk](#input\_local\_disk) | List of local disks that are attached to the instance. Structure is documented below. | <pre>object({<br>    size_bytes = optional(list(number))<br>  })</pre> | `null` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | Metadata key/value pairs to make available from within the instance. | `map(any)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Resource name. | `string` | `""` | no |
| <a name="input_network_acceleration_type"></a> [network\_acceleration\_type](#input\_network\_acceleration\_type) | Type of network acceleration. The default is standard. Values: standard, software\_accelerated. | `string` | `"standard"` | no |
| <a name="input_network_interface"></a> [network\_interface](#input\_network\_interface) | Networks to attach to the instance. This can be specified multiple times. The structure is documented below. | <pre>object({<br>    subnet_id          = string<br>    ipv4               = optional(bool)<br>    ip_address         = optional(string)<br>    ipv6               = optional(bool)<br>    ipv6_address       = optional(string)<br>    nat                = optional(bool)<br>    nat_ip_address     = optional(string)<br>    security_group_ids = optional(list(string))<br>    dns_record = optional(object({<br>      fqdn        = string<br>      dns_zone_id = optional(string)<br>      ttl         = optional(number)<br>      ptr         = optional(string)<br>    }))<br>    ipv6_dns_record = optional(object({<br>      fqdn        = string<br>      dns_zone_id = optional(string)<br>      ttl         = optional(number)<br>      ptr         = optional(string)<br>    }))<br>    nat_dns_record = optional(object({<br>      fqdn        = string<br>      dns_zone_id = optional(string)<br>      ttl         = optional(number)<br>      ptr         = optional(string)<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_placement_policy"></a> [placement\_policy](#input\_placement\_policy) | The placement policy configuration. The structure is documented below. | <pre>object({<br>    placement_group_id = optional(string)<br>    host_affinity_rules = optional(list(object({<br>      key    = string<br>      op     = string<br>      values = list(string)<br>    })))<br>  })</pre> | `null` | no |
| <a name="input_platform_id"></a> [platform\_id](#input\_platform\_id) | The type of virtual machine to create. The default is 'standard-v1'. | `string` | `"standard-v1"` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | Compute resources that are allocated for the instance. The structure is documented below. | <pre>object({<br>    cores         = number<br>    memory        = number<br>    core_fraction = optional(number)<br>  })</pre> | n/a | yes |
| <a name="input_scheduling_policy"></a> [scheduling\_policy](#input\_scheduling\_policy) | Scheduling policy configuration. The structure is documented below. | <pre>object({<br>    preemptible = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_secondary_disk"></a> [secondary\_disk](#input\_secondary\_disk) | A list of disks to attach to the instance. | <pre>map(object({<br>    params = optional(object({<br>      auto_delete = optional(bool)<br>      device_name = optional(string)<br>      mode        = optional(string)<br>    }))<br>    values = object({<br>      name        = optional(string)<br>      description = optional(string)<br>      size        = optional(number)<br>      block_size  = optional(number)<br>      type        = optional(string)<br>      snapshot_id = optional(string)<br>      disk_placement_policy = optional(object({<br>        disk_placement_group_id = optional(string)<br>      }))<br>    })<br>  }))</pre> | `{}` | no |
| <a name="input_service_account_id"></a> [service\_account\_id](#input\_service\_account\_id) | ID of the service account authorized for this instance. | `string` | `""` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The availability zone where the virtual machine will be created. If it is not provided, the default provider folder is used. | `string` | `"ru-central1-b"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | The internal IP address of the instance. |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_nat_ip_address"></a> [nat\_ip\_address](#output\_nat\_ip\_address) | The external IP address of the instance. |
