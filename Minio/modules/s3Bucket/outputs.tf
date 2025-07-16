output "id" {
  description = "The ID of this resource."
  value       = minio_s3_bucket.s3_bucket.id
}

output "arn" {
  description = "ARN of the bucket."
  value       = minio_s3_bucket.s3_bucket.arn
}

output "bucket_domain_name" {
  description = "The bucket domain name."
  value       = minio_s3_bucket.s3_bucket.bucket_domain_name
}
