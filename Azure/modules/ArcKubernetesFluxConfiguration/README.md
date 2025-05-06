# Manages an Arc Kubernetes Flux Configuration

## Sample of use:

```bash
module "arc_kubernetes_cluster_extension_<project>" {
  source     = "git::https://example.com/arc_kubernetes_cluster_extension_<my_repo>.git"
  name       = "example-fc"
  cluster_id = azurerm_arc_kubernetes_cluster.test.id
  namespace  = "flux"

  git_repository_block = {
    url             = "https://github.com/Azure/arc-k8s-demo"
    reference_type  = "branch"
    reference_value = "main"
  }

  kustomizations_block = {
    name = "kustomization-1"
  }

  depends_on = [
    azurerm_arc_kubernetes_cluster_extension.example
  ]
}
```

### Variables:

```bash
- name (Required)
- cluster_id (Required)
- kustomizations_block (Required)
- namespace (Required)
- blob_storage_block (Optional)
- bucket_block (Optional)
- git_repository_block (Optional)
- scope (Optional)
- continuous_reconciliation_enabled (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_arc_kubernetes_flux_configuration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/arc_kubernetes_flux_configuration)
