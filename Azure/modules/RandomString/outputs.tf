output "id" {
  description = "The generated random string id."
  value       = random_string.string.id
}

output "result" {
  description = "The generated random string result."
  value       = random_string.string.result
}