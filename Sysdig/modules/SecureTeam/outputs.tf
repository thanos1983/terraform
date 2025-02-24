output "enable_ibm_platform_metrics" {
  description = "Enable platform metrics on IBM Cloud Monitoring."
  value       = sysdig_secure_team.secure_team.enable_ibm_platform_metrics
}

output "ibm_platform_metrics" {
  description = "Define platform metrics on IBM Cloud Monitoring."
  value       = sysdig_secure_team.secure_team.ibm_platform_metrics
}

output "name" {
  description = "Sysdig Secure Team Name."
  value       = sysdig_secure_team.secure_team.name
}