output "bcrypt_hash" {
  description = "A bcrypt hash of the generated random string."
  value       = random_password.password.bcrypt_hash
}

output "id" {
  description = "A static value used internally by Terraform, this should not be referenced in configurations."
  value       = random_password.password.id
}

output "result" {
  description = "The generated random string."
  value       = random_password.password.result
}