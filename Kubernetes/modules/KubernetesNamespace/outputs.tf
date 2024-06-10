output "generation" {
  description = "A sequence number representing a specific generation of the desired state."
  value       = kubernetes_namespace_v1.namespace.generation
}

output "resource_version" {
  description = "An opaque value that represents the internal version of this secret that can be used by clients to determine when secret has changed."
  value       = kubernetes_namespace_v1.namespace.resource_version
}

output "uid" {
  description = "The unique in time and space value for this secret."
  value       = kubernetes_namespace_v1.namespace.uid
}