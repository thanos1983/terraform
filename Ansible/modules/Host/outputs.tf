output "id" {
  description = "The id of this resource."
  value       = ansible_host.host.id
}

output "name" {
  description = "The name of this resource."
  value       = ansible_host.host.name
}