terraform {
  required_version = ">= 1.4.4"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.89.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "yandex" {
}

provider "random" {
}
