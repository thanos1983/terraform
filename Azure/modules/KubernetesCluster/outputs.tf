output "id" {
  description = "The Kubernetes Managed Cluster ID."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.id
}

output "current_kubernetes_version" {
  description = "The current version running on the Azure Kubernetes Managed Cluster."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.current_kubernetes_version
}

output "fqdn" {
  description = "The FQDN of the Azure Kubernetes Managed Cluster."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.fqdn
}

output "private_fqdn" {
  description = "The FQDN for the Kubernetes Cluster when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.private_fqdn
}

output "portal_fqdn" {
  description = "The FQDN for the Azure Portal resources when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.portal_fqdn
}

output "kube_admin_config" {
  description = "A kube_admin_config block as defined below."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.kube_admin_config
  sensitive   = true
}

output "kube_admin_config_raw" {
  description = "Raw Kubernetes config for the admin account to be used by kubectl and other compatible tools."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.kube_admin_config_raw
  sensitive   = true
}

output "kube_config" {
  description = "A kube_config block as defined below."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.kube_config
  sensitive   = true
}

output "kube_config_raw" {
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.kube_config_raw
  sensitive   = true
}

output "http_application_routing_zone_name" {
  description = "The Zone Name of the HTTP Application Routing."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.http_application_routing_zone_name
}

output "oidc_issuer_url" {
  description = "The OIDC issuer URL that is associated with the cluster."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.oidc_issuer_url
}

output "node_resource_group" {
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.node_resource_group
}

output "node_resource_group_id" {
  description = "The ID of the Resource Group containing the resources for this Managed Kubernetes Cluster."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.node_resource_group_id
}

output "ingress_application_gateway" {
  description = "An ingress_application_gateway block as defined below."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.ingress_application_gateway
}

output "oms_agent" {
  description = "An oms_agent block as defined below."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.oms_agent
}

output "key_vault_secrets_provider" {
  description = "A key_vault_secrets_provider block as defined below."
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.key_vault_secrets_provider
}

output "aci_connector_linux" {
  description = "The aci_connector_linux block exports the following (connector_identity)."
  value = azurerm_kubernetes_cluster.kubernetes_cluster.aci_connector_linux
}

output "kubelet_identity" {
  description = "The connector_identity block exports the following (client_id, object_id, user_assigned_identity_id)"
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.kubelet_identity
}

output "network_profile" {
  description = "A network_profile block exports the following (load_balancer_profile, nat_gateway_profile)"
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.network_profile
}

output "identity" {
  description = "The identity block exports the following (principal_id, tenant_id)"
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.identity
}

output "web_app_routing" {
  description = "A network_profile block exports the following (web_app_routing_identity)"
  value       = azurerm_kubernetes_cluster.kubernetes_cluster.web_app_routing
}
