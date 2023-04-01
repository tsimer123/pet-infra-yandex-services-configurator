output "id" {
  value = yandex_compute_instance.this.id
}

output "name" {
  value = yandex_compute_instance.this.name
}

output "ip_address" {
  value       = yandex_compute_instance.this.network_interface[0].ip_address
  description = "The internal IP address of the instance."
}

output "nat_ip_address" {
  value       = yandex_compute_instance.this.network_interface[0].nat_ip_address
  description = "The external IP address of the instance."
}
