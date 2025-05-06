output "id" {
  description = "The ID of the Arc Kubernetes Cluster."
  value       = azurerm_arc_kubernetes_cluster.arc_kubernetes_cluster.id
}

output "agent_version" {
  description = "Version of the agent running on the cluster resource."
  value       = azurerm_arc_kubernetes_cluster.arc_kubernetes_cluster.agent_version
}

output "distribution" {
  description = "The distribution running on this Arc Kubernetes Cluster."
  value       = azurerm_arc_kubernetes_cluster.arc_kubernetes_cluster.distribution
}

output "identity" {
  description = "An identity block as defined below."
  value       = azurerm_arc_kubernetes_cluster.arc_kubernetes_cluster.identity
}

output "infrastructure" {
  description = "The infrastructure on which the Arc Kubernetes Cluster is running on."
  value       = azurerm_arc_kubernetes_cluster.arc_kubernetes_cluster.infrastructure
}

output "kubernetes_version" {
  description = "The Kubernetes version of the cluster resource."
  value       = azurerm_arc_kubernetes_cluster.arc_kubernetes_cluster.kubernetes_version
}

output "offering" {
  description = "The cluster offering."
  value       = azurerm_arc_kubernetes_cluster.arc_kubernetes_cluster.offering
}

output "total_core_count" {
  description = "Number of CPU cores present in the cluster resource."
  value       = azurerm_arc_kubernetes_cluster.arc_kubernetes_cluster.total_core_count
}

output "total_node_count" {
  description = "Number of nodes present in the cluster resource."
  value       = azurerm_arc_kubernetes_cluster.arc_kubernetes_cluster.total_node_count
}
