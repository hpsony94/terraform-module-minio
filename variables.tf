variable "minio_server" {
  description = "MinIO URL to access"
  default     = "localhost:9000"
}

variable "minio_access_key" {
  description = "MinIO access key to access"
  default     = ""
}

variable "minio_secret_key" {
  description = "MinIO Secret key to access"
  default     = ""
}

variable "buckets" {
  description = "List buckets in MinIO"
  type        = list(any)
  default     = []
}