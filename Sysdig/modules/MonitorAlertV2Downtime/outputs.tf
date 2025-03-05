output "id" {
  description = "ID of the alert created."
  value       = sysdig_monitor_alert_v2_downtime.monitor_alert_v2_downtime.id
}

output "version" {
  description = "Current version of the resource in Sysdig Monitor."
  value       = sysdig_monitor_alert_v2_downtime.monitor_alert_v2_downtime.version
}

output "team" {
  description = "Team ID that owns the alert."
  value       = sysdig_monitor_alert_v2_downtime.monitor_alert_v2_downtime.team
}
