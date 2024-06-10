output "id" {
  description = "A sequence number representing a specific generation of the desired state."
  value       = kubernetes_namespace_v1.namespace.id
}