output "id" {
  description = "Current id of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_syscall.secure_rule_syscall.id
}

output "name" {
  description = "Current name of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_syscall.secure_rule_syscall.name
}

output "version" {
  description = "Current version of the resource in Sysdig Secure."
  value       = sysdig_secure_rule_syscall.secure_rule_syscall.version
}
