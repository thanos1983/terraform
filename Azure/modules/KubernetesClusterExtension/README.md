# Kubernetes Cluster Extension

## Sample of use:

```bash
module "kubernetes_cluster_extension_<project>" {
  source  = "git::https://example.com/kubernetes_cluster_extension_<my_repo>.git"
  # NOTE: the `name` parameter must be "acstor" for Azure CLI compatibility
  name           = "acstor"
  cluster_id     = azurerm_kubernetes_cluster.aks.id
  extension_type = "microsoft.azurecontainerstoragev2"
}
```

### Variables:

```bash
- name (Required)
- cluster_id (Required)
- extension_type (Required)
- configuration_protected_settings (Optional)
- configuration_settings (Optional)
- plan_block (Optional)
- release_train (Optional)
- release_namespace (Optional)
- target_namespace (Optional)
- aks_extension_version (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
- aks_assigned_identity
- current_version
```

###### More information can be found on the official document [kubernetes_cluster_extension](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension)
