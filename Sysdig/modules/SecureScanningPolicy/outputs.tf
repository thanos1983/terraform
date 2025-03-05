output "id" {
  description = "Current id of the resource in Sysdig Secure policy."
  value       = sysdig_secure_scanning_policy.secure_scanning_policy.id
}

output "name" {
  description = "Current name of the resource in Sysdig Secure policy"
  value       = sysdig_secure_scanning_policy.secure_scanning_policy.name
}
