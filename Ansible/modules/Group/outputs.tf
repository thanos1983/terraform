output "id" {
  description = "The id of this resource."
  value       = ansible_group.group.id
}

output "name" {
  description = "The name of this resource."
  value       = ansible_group.group.name
}