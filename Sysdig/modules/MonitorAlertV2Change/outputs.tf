output "id" {
  description = "ID of the alert created."
  value       = sysdig_monitor_alert_v2_change.monitor_alert_v2_change.id
}

output "version" {
  description = "Current version of the resource in Sysdig Monitor."
  value       = sysdig_monitor_alert_v2_change.monitor_alert_v2_change.version
}

output "team" {
  description = "Team ID that owns the alert."
  value       = sysdig_monitor_alert_v2_change.monitor_alert_v2_change.team
}
