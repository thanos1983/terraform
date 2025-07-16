resource "minio_s3_bucket" "s3_bucket" {
  acl            = var.acl
  bucket         = var.bucket
  bucket_prefix  = var.bucket_prefix
  force_destroy  = var.force_destroy
  object_locking = var.object_locking
  quota          = var.quota
}
