resource "yandex_storage_bucket" "this" {
  folder_id  = yandex_resourcemanager_folder.this.id
  bucket     = "ts-mr-terraform"
  access_key = yandex_iam_service_account_static_access_key.this.access_key
  secret_key = yandex_iam_service_account_static_access_key.this.secret_key

  depends_on = [
    yandex_iam_service_account.this
  ]
}
