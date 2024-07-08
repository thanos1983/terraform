output "id" {
  description = "The generated uuid presented in string format."
  value       = random_uuid.uuid.id
}

output "result" {
  description = "The generated uuid presented in string format."
  value       = random_uuid.uuid.result
}