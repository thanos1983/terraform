output "id" {
  description = "Current id of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_process.secure_rule_process.id
}

output "name" {
  description = "Current name of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_process.secure_rule_process.name
}

output "version" {
  description = "Current version of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_process.secure_rule_process.version
}
