output "id" {
  description = "ID of the created team."
  value       = sysdig_secure_team.secure_team.id
}

output "version" {
  description = "Current version of the resource."
  value       = sysdig_secure_team.secure_team.version
}

output "name" {
  description = "The name of the Secure Team."
  value       = sysdig_secure_team.secure_team.name
}
