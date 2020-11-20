resource "minio_s3_bucket" "bucket" {
  count  = length(var.buckets)
  bucket = lookup(element(var.buckets, count.index), "name", null)
  acl    = lookup(element(var.buckets, count.index), "acl", "public")
}

resource "minio_iam_user" "bucket" {
  count  = length(var.buckets)
  name   = lookup(element(var.buckets, count.index), "name", null)
}

resource "minio_iam_policy" "bucket" {
  count  = length(var.buckets)
  name   = lookup(element(var.buckets, count.index), "name", null)
  policy =  element(data.minio_iam_policy_document.bucket.*.json, count.index)
}

data "minio_iam_policy_document" "bucket" {
  count  = length(var.buckets)
  statement {
    sid     = "1"
    actions = ["s3:*"]
    resources = [
      "arn:aws:s3:::${lookup(element(var.buckets, count.index), "name", null)}",
      "arn:aws:s3:::${lookup(element(var.buckets, count.index), "name", null)}/*",
    ]
  }
}

resource "minio_iam_user_policy_attachment" "bucket" {
  count  = length(var.buckets)
  user_name   = element(minio_iam_user.bucket.*.name, count.index)
  policy_name = element(minio_iam_policy.bucket.*.name, count.index)
}





