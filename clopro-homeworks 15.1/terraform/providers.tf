terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  service_account_key_file = "/home/zag1988/lan/key.json"
  cloud_id  = var.cloud_id
  folder_id = "b1g7uad4bpp6ioe1fc7h"
  zone      = var.default_zone
}