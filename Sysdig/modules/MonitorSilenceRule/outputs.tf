output "id" {
  description = "The ID of the Silence Rule."
  value       = sysdig_monitor_silence_rule.monitor_silence_rule.id
}

output "version" {
  description = "The current version of the Silence Rule."
  value       = sysdig_monitor_silence_rule.monitor_silence_rule.version
}
