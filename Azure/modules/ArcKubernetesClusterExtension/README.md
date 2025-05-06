# Manages an Arc Kubernetes Cluster Extension

## Sample of use:

```bash
module "arc_kubernetes_cluster_extension_<project>" {
  source         = "git::https://example.com/arc_kubernetes_cluster_extension_<my_repo>.git"
  name           = "example-ext"
  cluster_id     = azurerm_arc_kubernetes_cluster.example.id
  extension_type = "microsoft.flux"

  identity_block = {
    type = "SystemAssigned"
  }
}
```

### Variables:

```bash
- name (Required)
- cluster_id (Required)
- extension_type (Required)
- configuration_protected_settings (Optional)
- configuration_settings (Optional)
- identity_block (Required)
- release_train (Optional)
- release_namespace (Optional)
- target_namespace (Optional)
- extension_version (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
- current_version
- identity
```

###### More information can be found on the official document [azurerm_arc_kubernetes_cluster_extension](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/arc_kubernetes_cluster_extension)
