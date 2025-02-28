output "id" {
  description = "Current id of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_container.secure_rule_container.id
}

output "name" {
  description = "Current name of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_container.secure_rule_container.name
}

output "version" {
  description = "Current version of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_container.secure_rule_container.version
}
