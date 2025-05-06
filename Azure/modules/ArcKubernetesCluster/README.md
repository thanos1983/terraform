# Manages an Arc Kubernetes Cluster

## Sample of use:

```bash
module "arc_kubernetes_cluster_<project>" {
  source                       = "git::https://example.com/arc_kubernetes_cluster_<my_repo>.git"
  name                         = "example-akcc"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = "West Europe"
  agent_public_key_certificate = filebase64("testdata/public.cer")

  identity_block = {
    type = "SystemAssigned"
  }

  tags = {
    ENV = "Test"
  }
}
```

### Variables:

```bash
- name (Required)
- resource_group_name (Required)
- agent_public_key_certificate (Required)
- identity_block (Required)
- location (Required)
- tags (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- agent_version
- distribution
- identity
- infrastructure
- kubernetes_version
- offering
- total_core_count
- total_node_count
```

###### More information can be found on the official document [azurerm_arc_kubernetes_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/arc_kubernetes_cluster)
