output "generation" {
  description = "A sequence number representing a specific generation of the desired state."
  value       = kubernetes_cluster_role_v1.cluster_role_v1
}

output "resource_version" {
  description = "An opaque value that represents the internal version of this object that can be used by clients to determine when the object has changed."
  value       = kubernetes_cluster_role_v1.cluster_role_v1
}

output "uid" {
  description = "The unique in time and space value for this cluster role binding."
  value       = kubernetes_cluster_role_v1.cluster_role_v1
}