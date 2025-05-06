# Manages an Arc Kubernetes Provisioned Cluster

## Sample of use:

```bash
module "arc_kubernetes_provisioned_cluster_<project>" {
  source              = "git::https://example.com/arc_kubernetes_provisioned_cluster_<my_repo>.git"
  name                = "example-akpc"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  azure_active_directory_block = {
    azure_rbac_enabled     = true
    admin_group_object_ids = [azuread_group.example.id]
    tenant_id              = data.azurerm_client_config.current.tenant_id
  }

  identity_block = {
    type = "SystemAssigned"
  }
}
```

### Variables:

```bash
- name (Required)
- resource_group_name (Required)
- identity_block (Required)
- location (Required)
- arc_agent_auto_upgrade_enabled (Optional)
- arc_agent_desired_version (Optional)
- azure_active_directory_block (Optional)
- tags (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
- agent_version
- distribution
- identity
- infrastructure
- kubernetes_version
- offering
- total_core_count
- total_node_count
```

###### More information can be found on the official document [azurerm_arc_kubernetes_provisioned_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/arc_kubernetes_provisioned_cluster)
