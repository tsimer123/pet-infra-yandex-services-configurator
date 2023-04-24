resource "random_string" "kube_suffix" {
  length  = 16
  special = false
  lower   = true
  upper   = false
}
