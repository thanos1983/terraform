# Kubernetes Cluster

## Sample of use:

```bash
module "kubernetes_cluster_<project>" {
  source  = "git::https://example.com/kubernetes_cluster_<my_repo>.git"
  name = "my_kubernetes_cluster"
  .
  .
  .
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
