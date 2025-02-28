output "id" {
  description = "Current id of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_falco.secure_rule_falco.id
}

output "name" {
  description = "Current name of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_falco.secure_rule_falco.name
}

output "version" {
  description = "Current version of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_falco.secure_rule_falco.version
}
