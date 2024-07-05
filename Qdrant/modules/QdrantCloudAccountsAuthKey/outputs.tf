output "created_at" {
  description = "Auth Keys Keys Schema Timestamp when the Auth Key is created field."
  value       = qdrant-cloud_accounts_auth_key.accounts_auth_key.created_at
}

output "id" {
  description = "Auth Keys Keys Schema Auth Key Identifier field."
  value       = qdrant-cloud_accounts_auth_key.accounts_auth_key.id
}

output "prefix" {
  description = "Auth Keys Keys Schema Prefix of the Auth Key (the first few bytes from the token) field."
  value       = qdrant-cloud_accounts_auth_key.accounts_auth_key.prefix
}

output "token" {
  description = "Auth Keys Keys Schema Secret token for this Auth Key (handle with care!) field."
  value       = qdrant-cloud_accounts_auth_key.accounts_auth_key.token
}

output "user_id" {
  description = "Auth Keys Keys Schema User Idetifier from whom the Auth Key has been created field."
  value       = qdrant-cloud_accounts_auth_key.accounts_auth_key.user_id
}