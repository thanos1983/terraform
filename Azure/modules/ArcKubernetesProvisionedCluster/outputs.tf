output "id" {
  description = "The ID of the Arc Kubernetes Provisioned Cluster."
  value       = azurerm_arc_kubernetes_provisioned_cluster.arc_kubernetes_provisioned_cluster.id
}

output "name" {
  description = "The Name of the Arc Kubernetes Provisioned Cluster."
  value       = azurerm_arc_kubernetes_provisioned_cluster.arc_kubernetes_provisioned_cluster.name
}

output "agent_version" {
  description = "The version of the agent running on the cluster resource."
  value       = azurerm_arc_kubernetes_provisioned_cluster.arc_kubernetes_provisioned_cluster.agent_version
}

output "distribution" {
  description = "The distribution running on this Arc Kubernetes Provisioned Cluster."
  value       = azurerm_arc_kubernetes_provisioned_cluster.arc_kubernetes_provisioned_cluster.distribution
}

output "identity" {
  description = "An identity block as defined below."
  value       = azurerm_arc_kubernetes_provisioned_cluster.arc_kubernetes_provisioned_cluster.identity
}

output "infrastructure" {
  description = "The infrastructure on which the Arc Kubernetes Provisioned Cluster is running on."
  value       = azurerm_arc_kubernetes_provisioned_cluster.arc_kubernetes_provisioned_cluster.infrastructure
}

output "kubernetes_version" {
  description = "The Kubernetes version of the cluster resource."
  value       = azurerm_arc_kubernetes_provisioned_cluster.arc_kubernetes_provisioned_cluster.kubernetes_version
}

output "offering" {
  description = "The cluster offering."
  value       = azurerm_arc_kubernetes_provisioned_cluster.arc_kubernetes_provisioned_cluster.offering
}

output "total_core_count" {
  description = "The number of CPU cores present in the cluster resource."
  value       = azurerm_arc_kubernetes_provisioned_cluster.arc_kubernetes_provisioned_cluster.total_core_count
}

output "total_node_count" {
  description = "The number of nodes present in the cluster resource."
  value       = azurerm_arc_kubernetes_provisioned_cluster.arc_kubernetes_provisioned_cluster.total_node_count
}
