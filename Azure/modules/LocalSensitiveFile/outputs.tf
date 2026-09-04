output "content_base64sha256" {
  description = "Base64 encoded SHA256 checksum of file content."
  value       = local_sensitive_file.file.content_base64sha256
}

output "content_base64sha512" {
  description = "Base64 encoded SHA512 checksum of file content."
  value       = local_sensitive_file.file.content_base64sha512
}

output "content_md5" {
  description = "MD5 checksum of file content."
  value       = local_sensitive_file.file.content_md5
}

output "content_sha1" {
  description = "SHA1 checksum of file content."
  value       = local_sensitive_file.file.content_sha1
}

output "content_sha256" {
  description = "SHA256 checksum of file content."
  value       = local_sensitive_file.file.content_sha256
}

output "content_sha512" {
  description = "SHA512 checksum of file content."
  value       = local_sensitive_file.file.content_sha512
}

output "id" {
  description = "The hexadecimal encoding of the SHA1 checksum of the file content."
  value       = local_sensitive_file.file.id
}