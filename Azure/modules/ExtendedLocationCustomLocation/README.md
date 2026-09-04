# Manages a Custom Location within an Extended Location

## Sample of use:

```bash
module "extended_location_custom_location_<project>" {
  source              = "git::https://example.com/extended_location_custom_location_<my_repo>.git"
  name                = "example-custom-location"
  resource_group_name = azurerm_resource_group.example.name
  location            = "West Europe"
  cluster_extension_ids = [
    azurerm_arc_kubernetes_cluster_extension.example.id
  ]
  display_name     = "example-custom-location"
  namespace        = "example-namespace"
  host_resource_id = azurerm_arc_kubernetes_cluster.example.id
  authentication {
    value = base64encode(azurerm_kubernetes_cluster.example.kube_config_raw)
  }
}
```

### Variables:

```bash
- name (Required)
- resource_group_name (Required)
- location (Required)
- namespace (Required)
- cluster_extension_ids (Required)
- host_resource_id (Required)
- authentication_block (Optional)
- display_name (Optional)
- host_type (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azuread_group](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group)