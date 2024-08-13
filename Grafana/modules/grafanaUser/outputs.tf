output "id" {
  description = "The ID of this resource."
  value       = grafana_user.user.id
}

output "user_id" {
  description = "The numerical ID of the Grafana user."
  value       = grafana_user.user.user_id
}

output "name" {
  description = "The name of the Grafana user."
  value       = grafana_user.user.name
}