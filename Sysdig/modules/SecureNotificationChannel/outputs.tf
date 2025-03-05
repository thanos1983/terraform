output "id" {
  description = "The id for the managed policy."
  value       = sysdig_secure_managed_ruleset.secure_managed_ruleset.id
}

output "name" {
  description = "The name for the managed policy."
  value       = sysdig_secure_managed_ruleset.secure_managed_ruleset.name
}
