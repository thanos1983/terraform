output "id" {
  description = "Current id of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_network.secure_rule_network.id
}

output "name" {
  description = "Current name of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_network.secure_rule_network.name
}

output "version" {
  description = "Current version of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_network.secure_rule_network.version
}
