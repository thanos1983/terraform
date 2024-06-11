output "metadata" {
  description = "Standard namespace's metadata."
  value       = kubernetes_secret_v1.secret.metadata
}

output "data" {
  description = "A map of the secret data."
  value       = kubernetes_secret_v1.secret.data
}