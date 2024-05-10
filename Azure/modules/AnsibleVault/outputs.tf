output "id" {
  description = "The ID of this resource."
  value       = ansible_vault.vault.id
}

output "args" {
  description = "List of String"
  value       = ansible_vault.vault.args
}

output "yaml" {
  description = "String, Sensitive"
  value       = ansible_vault.vault.yaml
  sensitive   = true
}