resource "yandex_kubernetes_cluster" "this" {
  name      = "Kubernetes"
  folder_id = yandex_resourcemanager_folder.this.id

  node_service_account_id = yandex_iam_service_account.this.id
  service_account_id      = yandex_iam_service_account.this.id

  network_id = data.yandex_vpc_network.this.id

  master {
    zonal {
      zone      = data.yandex_vpc_subnet.kube.zone
      subnet_id = data.yandex_vpc_subnet.kube.id
    }
    public_ip = true
  }

  depends_on = [
    yandex_resourcemanager_folder_iam_member.editor,
    yandex_resourcemanager_folder_iam_member.images_puller
  ]
}
