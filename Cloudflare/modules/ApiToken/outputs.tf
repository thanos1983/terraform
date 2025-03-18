output "id" {
  description = "The ID of this resource."
  value       = cloudflare_api_token.api_token.id
}

output "issued_on" {
  description = "Timestamp of when the token was issued."
  value       = cloudflare_api_token.api_token.issued_on
}

output "last_used_on" {
  description = "Last time the token was used."
  value       = cloudflare_api_token.api_token.last_used_on
}

output "modified_on" {
  description = "Timestamp of when the token was last modified."
  value       = cloudflare_api_token.api_token.modified_on
}

output "value" {
  description = "The value of the API Token."
  value       = cloudflare_api_token.api_token.value
}
