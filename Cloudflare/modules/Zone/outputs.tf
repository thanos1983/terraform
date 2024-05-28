output "id" {
  description = "The ID of this resource."
  value       = cloudflare_zone.zone.id
}

output "meta" {
  description = "Map of Boolean."
  value       = cloudflare_zone.zone.meta
}

output "name_servers" {
  description = "Cloudflare-assigned name servers."
  value       = cloudflare_zone.zone.name_servers
}

output "status" {
  description = "Status of the zone."
  value       = cloudflare_zone.zone.status
}

output "vanity_name_servers" {
  description = "List of Vanity Nameservers (if set)."
  value       = cloudflare_zone.zone.vanity_name_servers
}

output "verification_key" {
  description = "Contains the TXT record value to validate domain ownership."
  value       = cloudflare_zone.zone.verification_key
}