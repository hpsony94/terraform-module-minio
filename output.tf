output "user_minio_user" {
  value = "${minio_iam_user.bucket.*.id}"
}

output "minio_user_status" {
  value = "${minio_iam_user.bucket.*.status}"
}

output "minio_user_secret" {
  value = "${minio_iam_user.bucket.*.secret}"
}