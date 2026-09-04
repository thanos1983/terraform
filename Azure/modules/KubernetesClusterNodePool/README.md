# Kubernetes Cluster

## Sample of use:

```bash
module "kubernetes_cluster_node_pool_<project>" {
  source = "git::https://example.com/kubernetes_cluster_node_pool_<my_repo>.git"
  name   = "my_kubernetes_cluster_node_pool"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- kubernetes_cluster_id (Required)
- vm_size (Required)
- capacity_reservation_group_id (Optional)
- custom_ca_trust_enabled (Optional)
- enable_auto_scaling (Optional)
- enable_host_encryption (Optional)
- enable_node_public_ip  (Optional)
- eviction_policy  (Optional)
- host_group_id (Optional)
- kubelet_config_block (Optional)
- linux_os_config_block (Optional)
- fips_enabled (Optional)
- gpu_instance (Optional)
- kubelet_disk_type (Optional)
- max_pods (Optional)
- message_of_the_day (Optional)
- mode (Optional)
- node_network_profile_block (Optional)
- node_labels (Optional)
- node_public_ip_prefix_id (Optional)
- node_taints (Optional)
- orchestrator_version (Optional)
- os_disk_size_gb (Optional)
- os_disk_type (Optional)
- pod_subnet_id (Optional)
- os_sku (Optional)
- os_type (Optional)
- priority (Optional)
- proximity_placement_group_id (Optional)
- spot_max_price (Optional)
- snapshot_id (Optional)
- tags (Optional)
- scale_down_mode (Optional)
- ultra_ssd_enabled (Optional)
- upgrade_settings_block (Optional)
- vnet_subnet_id (Optional)
- windows_profile_block (Optional)
- workload_runtime (Optional)
- zones (Optional)
- max_count (Optional)
- min_count (Optional)
- node_count (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_kubernetes_cluster_node_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool)