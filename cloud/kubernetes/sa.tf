resource "yandex_iam_service_account" "kube_sa_cluster" {
  folder_id   = yandex_resourcemanager_folder.this.id
  name        = "kube-sa-cluster-${random_string.kube_suffix.result}"
  description = "kube-${random_string.kube_suffix.result} - cluster sa"
}

resource "yandex_iam_service_account" "kube_sa_node" {
  folder_id   = yandex_resourcemanager_folder.this.id
  name        = "kube-sa-node-${random_string.kube_suffix.result}"
  description = "kube-${random_string.kube_suffix.result} - node sa"
}
