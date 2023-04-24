resource "yandex_kubernetes_cluster" "this" {
  name        = "kubernetes-${random_string.kube_suffix.result}"
  description = "kube-${random_string.kube_suffix.result} - cluster"
  folder_id   = yandex_resourcemanager_folder.this.id

  node_service_account_id = yandex_iam_service_account.kube_sa_node.id
  service_account_id      = yandex_iam_service_account.kube_sa_cluster.id

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
    yandex_resourcemanager_folder_iam_member.kube_sa_cluster_agent,
    yandex_resourcemanager_folder_iam_member.kube_sa_cluster_vpc,
    yandex_resourcemanager_folder_iam_member.kube_sa_cluster_nlb,
    yandex_resourcemanager_folder_iam_member.kube_sa_node_cr,
    yandex_resourcemanager_folder_iam_member.kube_sa_cluster_editor,
    yandex_resourcemanager_folder_iam_member.kube_sa_cluster_editor_network,
    yandex_resourcemanager_folder_iam_member.kube_sa_cluster_vpc_network,
  ]
}
