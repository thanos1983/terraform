output "created_on" {
  description = "The RFC3339 timestamp of when the record was created."
  value       = cloudflare_record.record.created_on
}

output "hostname" {
  description = "The FQDN of the record."
  value       = cloudflare_record.record.hostname
}

output "id" {
  description = "The ID of this resource."
  value       = cloudflare_record.record.id
}

output "metadata" {
  description = "A key-value map of string metadata Cloudflare associates with the record."
  value       = cloudflare_record.record.metadata
}

output "modified_on" {
  description = "The RFC3339 timestamp of when the record was last modified."
  value       = cloudflare_record.record.modified_on
}

output "proxiable" {
  description = "Shows whether this record can be proxied."
  value       = cloudflare_record.record.proxiable
}