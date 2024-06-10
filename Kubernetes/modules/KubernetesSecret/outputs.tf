output "metadata" {
  description = "Standard namespace's metadata."
  value       = kubernetes_secret.secret.metadata
}