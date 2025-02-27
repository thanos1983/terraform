output "id" {
  description = "The id for the managed policy."
  value       = sysdig_secure_managed_policy.secure_managed_policy.id
}

output "name" {
  description = "The name for the managed policy."
  value       = sysdig_secure_managed_policy.secure_managed_policy.name
}
