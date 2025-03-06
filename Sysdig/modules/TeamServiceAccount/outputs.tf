output "id" {
  description = "The team service account id."
  value       = sysdig_team_service_account.team_service_account.id
}

output "name" {
  description = "The team service account name."
  value       = sysdig_team_service_account.team_service_account.name
}

output "date_created" {
  description = "The team service account date created."
  value       = sysdig_team_service_account.team_service_account.date_created
}

output "expiration_date" {
  description = "The team service account expiration date."
  value       = sysdig_team_service_account.team_service_account.expiration_date
}

output "api_key" {
  description = "The team service account API key."
  value       = sysdig_team_service_account.team_service_account.api_key
}
