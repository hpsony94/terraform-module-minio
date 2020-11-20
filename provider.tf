terraform {
  required_version = ">= 0.13.0"
  required_providers {
    minio = {
      source  = "github.com/aminueza/minio"
      versions = ["1.1.0"]
    }
  }
}

provider "minio" {
  minio_server      = var.minio_server
  minio_access_key  = var.minio_access_key
  minio_secret_key  = var.minio_secret_key
}
