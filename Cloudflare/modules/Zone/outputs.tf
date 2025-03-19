output "activated_on" {
  description = "The last time proof of ownership was detected and the zone was made active."
  value = cloudflare_zone.zone.activated_on
}

output "created_on" {
  description = "When the zone was created."
  value = cloudflare_zone.zone.created_on
}

output "development_mode" {
  description = "The interval (in seconds) from when development mode expires (positive integer) or last expired (negative integer) for the domain."
  value = cloudflare_zone.zone.development_mode
}

output "id" {
  description = "The ID of this resource."
  value       = cloudflare_zone.zone.id
}

output "meta" {
  description = "Map of Boolean."
  value       = cloudflare_zone.zone.meta
}

output "modified_on" {
  description = "When the zone was last modified."
  value       = cloudflare_zone.zone.modified_on
}

output "name_servers" {
  description = "Cloudflare-assigned name servers."
  value       = cloudflare_zone.zone.name_servers
}

output "original_dnshost" {
  description = "DNS host at the time of switching to Cloudflare."
  value       = cloudflare_zone.zone.original_dnshost
}

output "original_name_servers" {
  description = "Original name servers before moving to Cloudflare."
  value       = cloudflare_zone.zone.original_name_servers
}

output "original_registrar" {
  description = "Registrar for the domain at the time of switching to Cloudflare."
  value       = cloudflare_zone.zone.original_registrar
}

output "owner" {
  description = "The owner of the zone."
  value       = cloudflare_zone.zone.owner
}

output "paused" {
  description = "Indicates whether the zone is only using Cloudflare DNS services."
  value       = cloudflare_zone.zone.paused
}

output "status" {
  description = "Status of the zone."
  value       = cloudflare_zone.zone.status
}

output "verification_key" {
  description = "Contains the TXT record value to validate domain ownership."
  value       = cloudflare_zone.zone.verification_key
}
