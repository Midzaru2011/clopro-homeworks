# locals {
#   folder_id = "b1g7uad4bpp6ioe1fc7h"
# }


//Create SA
resource "yandex_iam_service_account" "bucket-sa" {
  name        = "bucket-sa"
  description = "service account for bucket"
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_member" "bucket-admin" {
  folder_id  = var.folder_id
  role       = "storage.admin"
  member     = "serviceAccount:${yandex_iam_service_account.bucket-sa.id}"
  depends_on = [yandex_iam_service_account.bucket-sa]
}


// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.bucket-sa.id
  description        = "static access key for object storage"
}

// Create bucket
resource "yandex_storage_bucket" "vp-bucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = "sasha-netology-bucket-2024"
  acl        = "public-read"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-bucket.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
  anonymous_access_flags {
    read = true
    list = true
  }
  website {
    index_document = "index.html"
  }
}

// add image to bucket

# Add picture in the bucket
# resource "yandex_storage_object" "image" {
#   access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
#   secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
#   bucket     = yandex_storage_bucket.vp-bucket.id
#   key        = "my-image.jpeg"
#   source     = "my-image.jpeg"
# }