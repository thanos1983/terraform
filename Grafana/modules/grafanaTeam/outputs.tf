output "id" {
  description = "The ID of this resource."
  value       = grafana_team.team.id
}

output "team_id" {
  description = "The team id assigned to this team by Grafana."
  value       = grafana_team.team.team_id
}

output "name" {
  description = "The name assigned to this team by Grafana."
  value       = grafana_team.team.name
}