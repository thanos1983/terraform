output "id" {
  description = "The agent access key id."
  value       = sysdig_agent_access_key.agent_access_key.id
}

output "access_key" {
  description = "The agent access key."
  value       = sysdig_agent_access_key.agent_access_key.access_key
}

output "date_disabled" {
  description = "Date when the agent key was last disabled."
  value       = sysdig_agent_access_key.agent_access_key.date_disabled
}

output "date_created" {
  description = "Date when the agent key was last created."
  value       = sysdig_agent_access_key.agent_access_key.date_created
}
