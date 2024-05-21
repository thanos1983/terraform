output "generation" {
  description = "A sequence number representing a specific generation of the desired state."
  value       = kubernetes_role_v1.role_v1.generation
}

output "resource_version" {
  description = "An opaque value that represents the internal version of this role that can be used by clients to determine when role has changed."
  value       = kubernetes_role_v1.role_v1.resource_version
}

output "uid" {
  description = "The unique in time and space value for this role."
  value       = kubernetes_role_v1.role_v1.uid
}