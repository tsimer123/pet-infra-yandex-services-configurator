resource "yandex_iam_service_account" "this" {
  folder_id   = yandex_resourcemanager_folder.this.id
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
