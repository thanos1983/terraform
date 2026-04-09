# Kubernetes Cluster

## Sample of use:

```bash
# Create AKS cluster
module "aks_project_aks_cluster" {
  source                    = "git::https://example.com/kubernetes_cluster_<my_repo>.git"
  tags                      = var.tags
  sku_tier                  = var.sku_tier
  name                      = var.aks_cluster_name
  kubernetes_version        = var.kubernetes_version
  linux_profile_block = {
    admin_username = var.username
    ssh_key_block = {
      key_data = file("~/.ssh/id_ed25519.pub")
    }
  }
  role_definition_names     = var.aks_role_definition_names
  open_service_mesh_enabled = var.open_service_mesh_enabled
  dns_prefix                = module.aks_project_resource_group.name
  resource_group_name       = module.aks_project_resource_group.name
  location                  = module.aks_project_resource_group.location
  network_profile_block = {
    network_plugin = var.network_plugin
    network_policy = var.network_policy
  }
  storage_profile_block = {
    disk_driver_enabled = var.disk_driver_enabled
  }
  azure_active_directory_role_based_access_control_block = {
    azure_rbac_enabled     = var.azure_rbac_enabled
    tenant_id              = data.azurerm_client_config.current.tenant_id
    admin_group_object_ids = [module.aks_project_active_directory_group["admin-group"].object_id]
  }
  default_node_pool_block = {
    name                        = var.default_node_pool_block.name
    vm_size                     = var.default_node_pool_block.vm_size
    max_pods                    = var.default_node_pool_block.max_pods
    node_count                  = var.default_node_pool_block.node_count
    vnet_subnet_id              = module.aks_project_virtual_network_subNet["aks"].id
    temporary_name_for_rotation = var.default_node_pool_block.temporary_name_for_rotation
    upgrade_settings_block = {
      max_surge                     = var.default_node_pool_block.upgrade_settings_block.max_surge
      drain_timeout_in_minutes      = var.default_node_pool_block.upgrade_settings_block.drain_timeout_in_minutes
      node_soak_duration_in_minutes = var.default_node_pool_block.upgrade_settings_block.node_soak_duration_in_minutes
    }
  }
}
```

### Variables:

```bash
- name (Required)
- location (Required)
- resource_group_name (Required)
- default_node_pool_block (Optional)
- dns_prefix (Optional)
- dns_prefix_private_cluster (Optional)
- aci_connector_linux_block (Optional)
- automatic_upgrade_channel (Optional)
- api_server_access_profile_block (Optional)
- auto_scaler_profile_block (Optional)
- azure_active_directory_role_based_access_control_block (Optional)
- azure_policy_enabled (Optional)
- confidential_computing_block (Optional)
- disk_encryption_set_id (Optional)
- edge_zone (Optional)
- http_application_routing_enabled (Optional)
- http_proxy_config_block (Optional)
- identity_block (Optional)
- image_cleaner_enabled (Optional)
- image_cleaner_interval_hours (Optional)
- ingress_application_gateway_block (Optional)
- key_management_service_block (Optional)
- key_vault_secrets_provider_block (Optional)
- kubelet_identity_block (Optional)
- kubernetes_version (Optional)
- linux_profile_block (Optional)
- maintenance_window_block (Optional)
- maintenance_window_auto_upgrade_block (Optional)
- maintenance_window_node_os_block (Optional)
- microsoft_defender_block (Optional)
- monitor_metrics_block (Optional)
- network_profile_block (Optional)
- node_os_upgrade_channel (Optional)
- node_resource_group (Optional)
- oidc_issuer_enabled (Optional)
- oms_agent_block (Optional)
- open_service_mesh_enabled (Optional)
- private_cluster_enabled (Optional)
- private_dns_zone_id (Optional)
- private_cluster_public_fqdn_enabled (Optional)
- service_mesh_profile_block (Optional)
- workload_autoscaler_profile_block (Optional)
- workload_identity_enabled (Optional)
- role_based_access_control_enabled (Optional)
- run_command_enabled (Optional)
- service_principal_block (Optional)
- sku_tier (Optional)
- storage_profile_block (Optional)
- support_plan (Optional)
- tags (Optional)
- windows_profile_block (Optional)
```

### Output:

```bash
- id
- current_kubernetes_version
- fqdn
- private_fqdn
- portal_fqdn
- kube_admin_config
- kube_admin_config_raw
- kube_config
- kube_config_raw
- http_application_routing_zone_name
- oidc_issuer_url
- node_resource_group
- node_resource_group_id
- ingress_application_gateway
- oms_agent
- key_vault_secrets_provider
- aci_connector_linux
- kubelet_identity
- network_profile
- identity
- web_app_routing
```

###### More information can be found on the official document [azurerm_kubernetes_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster)
