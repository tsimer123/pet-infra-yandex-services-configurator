resource "yandex_kubernetes_cluster" "this" {
  name      = "kubernetes"
  folder_id = yandex_resourcemanager_folder.this.id

  node_service_account_id = yandex_iam_service_account.this.id
  service_account_id      = yandex_iam_service_account.this.id

  network_id               = data.yandex_vpc_network.this.id
  cluster_ipv4_range       = "10.7.0.0/16"
  service_ipv4_range       = "10.8.0.0/16"
  node_ipv4_cidr_mask_size = "24"

  master {
    zonal {
      zone      = data.yandex_vpc_subnet.kube.zone
      subnet_id = data.yandex_vpc_subnet.kube.id
    }
    public_ip = true

    maintenance_policy {
      auto_upgrade = false

      maintenance_window {
        start_time = "00:00"
        duration   = "3h"
      }
    }
  }

  release_channel         = "RAPID"
  network_policy_provider = "CALICO"

  kms_provider {
    key_id = yandex_kms_symmetric_key.this.id
  }

  depends_on = [
    yandex_resourcemanager_folder_iam_member.editor,
    yandex_resourcemanager_folder_iam_member.images_puller,
    yandex_resourcemanager_folder_iam_member.load_balancer_admin,
    yandex_resourcemanager_folder_iam_member.kubernetes_vpc_admin,
    yandex_resourcemanager_folder_iam_member.network_vpc_admin,
  ]
}
