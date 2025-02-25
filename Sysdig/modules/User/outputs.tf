output "email" {
  description = "The email for the user to invite."
  value       = sysdig_user.user.email
}

output "first_name" {
  description = "The name of the user."
  value       = sysdig_user.user.first_name
}

output "last_name" {
  description = "The last name of the user."
  value       = sysdig_user.user.last_name
}