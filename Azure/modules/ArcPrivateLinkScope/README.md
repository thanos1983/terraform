# Manages an Azure Arc Private Link Scope

## Sample of use:

```bash
module "arc_private_link_scope_<project>" {
  source              = "git::https://example.com/arc_private_link_scope_<my_repo>.git"
  name                = "plsexample"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  .
  .
  .
}
```

### Variables:

```bash
- location (Required)
- name (Required)
- resource_group_name (Required)
- public_network_access_enabled (Optional)
- tags (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_arc_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/arc_machine)
