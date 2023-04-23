resource "yandex_kubernetes_cluster" "this" {
  network_id = yandex_vpc_network.this.id
  master {
    zonal {
      zone      = yandex_vpc_subnet.kube.zone
      subnet_id = yandex_vpc_subnet.kube.id
    }
  }
  service_account_id      = yandex_iam_service_account.this.id
  node_service_account_id = yandex_iam_service_account.this.id
  depends_on = [
    yandex_resourcemanager_folder_iam_member.editor,
    yandex_resourcemanager_folder_iam_member.images_puller
  ]
}

resource "yandex_vpc_network" "this" { name = "this" }

resource "yandex_vpc_subnet" "kube" {
  v4_cidr_blocks = ["10.6.0.0/16"]
  zone           = local.zone
  network_id     = yandex_vpc_network.this.id
}

resource "yandex_iam_service_account" "this" {
  name        = "k8s"
  description = "servise account for kubernetes"
}

resource "yandex_resourcemanager_folder_iam_member" "editor" {
  # Сервисному аккаунту назначается роль "editor".
  folder_id = yandex_resourcemanager_folder.this.id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.this.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "images_puller" {
  # Сервисному аккаунту назначается роль "container-registry.images.puller".
  folder_id = yandex_resourcemanager_folder.this.id
  role      = "container-registry.images.puller"
  member    = "serviceAccount:${yandex_iam_service_account.this.id}"
}
