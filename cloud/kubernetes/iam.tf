resource "yandex_resourcemanager_folder_iam_member" "kube_sa_node_cr" {
  folder_id = yandex_resourcemanager_folder.this.id
  member    = "serviceAccount:${yandex_iam_service_account.kube_sa_node.id}"
  role      = "container-registry.images.puller"
}

resource "yandex_resourcemanager_folder_iam_member" "kube_sa_cluster_agent" {
  folder_id = yandex_resourcemanager_folder.this.id
  member    = "serviceAccount:${yandex_iam_service_account.kube_sa_cluster.id}"
  role      = "k8s.clusters.agent"
}

resource "yandex_resourcemanager_folder_iam_member" "kube_sa_cluster_nlb" {
  folder_id = yandex_resourcemanager_folder.this.id
  member    = "serviceAccount:${yandex_iam_service_account.kube_sa_cluster.id}"
  role      = "load-balancer.admin"
}

resource "yandex_resourcemanager_folder_iam_member" "kube_sa_cluster_vpc_network" {
  folder_id = data.yandex_resourcemanager_folder.network.id
  member    = "serviceAccount:${yandex_iam_service_account.kube_sa_cluster.id}"
  role      = "vpc.publicAdmin"
}

resource "yandex_resourcemanager_folder_iam_member" "kube_sa_cluster_editor_network" {
  folder_id = data.yandex_resourcemanager_folder.network.id
  member    = "serviceAccount:${yandex_iam_service_account.kube_sa_cluster.id}"
  role      = "editor"
}
