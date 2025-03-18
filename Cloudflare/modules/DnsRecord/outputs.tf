output "comment_modified_on" {
  description = "When the record comment was last modified."
  value       = cloudflare_dns_record.dns_record.comment_modified_on
}

output "created_on" {
  description = "When the record was created."
  value       = cloudflare_dns_record.dns_record.created_on
}

output "id" {
  description = "The ID of this resource."
  value       = cloudflare_dns_record.dns_record.id
}

output "meta" {
  description = "Extra Cloudflare-specific information about the record."
  value       = cloudflare_dns_record.dns_record.meta
}

output "modified_on" {
  description = "When the record was last modified."
  value       = cloudflare_dns_record.dns_record.modified_on
}

output "proxiable" {
  description = "Whether the record can be proxied by Cloudflare or not."
  value       = cloudflare_dns_record.dns_record.proxiable
}

output "tags_modified_on" {
  description = "When the record tags were last modified."
  value       = cloudflare_dns_record.dns_record.tags_modified_on
}
