output "id" {
  description = "The ID of the Kubernetes Cluster Node Pool."
  value       = azurerm_kubernetes_cluster_node_pool.kubernetes_cluster_node_pool.id
}

output "name" {
  description = "The name of the Kubernetes Cluster Node Pool."
  value       = azurerm_kubernetes_cluster_node_pool.kubernetes_cluster_node_pool.name
}