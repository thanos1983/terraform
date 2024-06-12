output "metadata" {
  description = "Standard kubernetes metadata."
  value       = kubernetes_cluster_role_v1.cluster_role.metadata
}

output "rule" {
  description = "The PolicyRoles for this ClusterRole."
  value       = kubernetes_cluster_role_v1.cluster_role.rule
}

output "aggregation_rule" {
  description = "Describes how to build the Rules for this ClusterRole."
  value       = kubernetes_cluster_role_v1.cluster_role.aggregation_rule
}