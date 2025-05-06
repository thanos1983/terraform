output "id" {
  description = "The ID of the Arc Kubernetes Cluster Extension."
  value       = azurerm_arc_kubernetes_cluster_extension.arc_kubernetes_cluster_extension.id
}

output "name" {
  description = "The Name of the Arc Kubernetes Cluster Extension."
  value       = azurerm_arc_kubernetes_cluster_extension.arc_kubernetes_cluster_extension.name
}

output "current_version" {
  description = "The current version of the extension."
  value       = azurerm_arc_kubernetes_cluster_extension.arc_kubernetes_cluster_extension.current_version
}

output "identity" {
  description = "An identity block as defined below."
  value       = azurerm_arc_kubernetes_cluster_extension.arc_kubernetes_cluster_extension.identity
}
