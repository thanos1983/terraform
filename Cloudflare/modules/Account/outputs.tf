output "id" {
  description = "The ID of this resource."
  value       = cloudflare_account.account.id
}

output "created_on" {
  description = "Timestamp for the creation of the account."
  value       = cloudflare_account.account.created_on
}
