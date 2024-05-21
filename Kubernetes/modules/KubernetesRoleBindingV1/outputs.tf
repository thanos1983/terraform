output "generation" {
  description = "A sequence number representing a specific generation of the desired state."
  value       = kubernetes_role_binding_v1.role_binding_v1.generation
}

output "resource_version" {
  description = "An opaque value that represents the internal version of this object that can be used by clients to determine when the object has changed."
  value       = kubernetes_role_binding_v1.role_binding_v1.resource_version
}

output "uid" {
  description = "The unique in time and space value for this role binding."
  value       = kubernetes_role_binding_v1.role_binding_v1.uid
}