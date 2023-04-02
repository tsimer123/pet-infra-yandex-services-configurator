resource "yandex_iam_service_account" "this" {
  folder_id   = yandex_resourcemanager_folder.this.id
  name        = "terraform"
  description = "Service account that required to upload terraform states"
}

resource "yandex_resourcemanager_folder_iam_member" "this" {
  folder_id = yandex_resourcemanager_folder.this.id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.this.id}"

  depends_on = [
    yandex_iam_service_account.this
  ]
}

resource "yandex_iam_service_account_static_access_key" "this" {
  service_account_id = yandex_iam_service_account.this.id
  description        = "Static access key for service account"

  depends_on = [
    yandex_iam_service_account.this
  ]
}
