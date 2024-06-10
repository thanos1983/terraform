output "generation" {
  description = "A sequence number representing a specific generation of the desired."
  value       = kubernetes_secret.secret.id
}