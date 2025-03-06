output "ip_filtering_enabled" {
  description = "The IP filtering settings enabled value."
  value       = sysdig_ip_filtering_settings.ip_filtering_settings.ip_filtering_enabled
}
