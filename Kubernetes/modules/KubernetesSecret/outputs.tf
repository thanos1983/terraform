output "generation" {
  description = "A sequence number representing a specific generation of the desired."
  value       = kubernetes_secret.secret.generation
}

output "resource_version" {
  description = "An opaque value that represents the internal version of this secret that can be used by clients to determine when secret has changed."
  value       = kubernetes_secret.secret.resource_version
}

output "uid" {
  description = "The unique in time and space value for this secret."
  value       = kubernetes_secret.secret.uid
}