output "id" {
  description = "The ID of the Kubernetes Cluster Extension."
  value       = azurerm_kubernetes_cluster_extension.kubernetes_cluster_extension.id
}

output "name" {
  description = "The name of the Kubernetes Cluster Extension."
  value       = azurerm_kubernetes_cluster_extension.kubernetes_cluster_extension.name
}

output "aks_assigned_identity" {
  description = "An aks_assigned_identity block."
  value       = azurerm_kubernetes_cluster_extension.kubernetes_cluster_extension.aks_assigned_identity
}

output "current_version" {
  description = "The current version of the extension."
  value       = azurerm_kubernetes_cluster_extension.kubernetes_cluster_extension.current_version
}
