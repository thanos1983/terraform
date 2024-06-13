output "id" {
  description = "The ID of this resource."
  value       = cloudflare_zone_settings_override.zone_settings_override.id
}

output "initial_settings" {
  description = "List of initial settings."
  value       = cloudflare_zone_settings_override.zone_settings_override.initial_settings
}

output "initial_settings_read_at" {
  description = "Initial settings read attribute."
  value       = cloudflare_zone_settings_override.zone_settings_override.initial_settings_read_at
}

output "readonly_settings" {
  description = "List of readonly settings."
  value       = cloudflare_zone_settings_override.zone_settings_override.readonly_settings
}

output "zone_status" {
  description = "The current status of the zone."
  value       = cloudflare_zone_settings_override.zone_settings_override.zone_status
}

output "zone_type" {
  description = "The zone type."
  value       = cloudflare_zone_settings_override.zone_settings_override.zone_type
}