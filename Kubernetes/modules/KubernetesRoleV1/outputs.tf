output "metadata" {
  description = "Standard kubernetes metadata."
  value       = kubernetes_role_v1.role_v1.metadata
}

output "rule" {
  description = "The PolicyRoles for this ClusterRole."
  value       = kubernetes_role_v1.role_v1.rule
}

output "aggregation_rule" {
  description = "Describes how to build the Rules for this ClusterRole."
  value       = kubernetes_role_v1.role_v1.aggregation_rule
}