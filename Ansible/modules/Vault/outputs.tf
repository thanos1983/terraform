output "id" {
  description = "The id of this resource."
  value       = ansible_vault.vault.id
}

output "args" {
  description = "List of strings."
  value       = ansible_vault.vault.args
}

output "yaml" {
  description = "String sensitive."
  value       = ansible_vault.vault.yaml
}