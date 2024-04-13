# Kubernetes Cluster

## Sample of use:

```bash
module "azure_kkubernetes_cluster_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_kubernetes_cluster"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- tenant_id (Required)
- object_id (Required)
- application_id (Optional)
- certificate_permissions (Optional)
- key_permissions (Optional)
- secret_permissions (Optional)
- storage_permissions  (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azurerm_kubernetes_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster)