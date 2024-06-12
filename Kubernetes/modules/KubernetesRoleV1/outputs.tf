output "metadata" {
  description = "Standard kubernetes metadata."
  value       = kubernetes_role_v1.role.metadata
}

output "rule" {
  description = "The PolicyRoles for this ClusterRole."
  value       = kubernetes_role_v1.role.rule
}