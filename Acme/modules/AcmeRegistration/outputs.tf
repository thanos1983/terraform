output "id" {
  description = "The original full URL of the account."
  value       = acme_registration.registration.id
}

output "account_key_pem" {
  description = "The private key used to identify the account (will be generated if not provided)."
  value       = acme_registration.registration.account_key_pem
}

output "registration_url" {
  description = "The current full URL of the account."
  value       = acme_registration.registration.registration_url
}