# Manages an Arc Resource Bridge Appliance

## Sample of use:

```bash
module "arc_resource_bridge_appliance_<project>" {
  source                  = "git::https://example.com/arc_resource_bridge_appliance_<my_repo>.git"
  name                    = "example-appliance"
  location                = azurerm_resource_group.example.location
  resource_group_name     = azurerm_resource_group.example.name
  distro                  = "AKSEdge"
  infrastructure_provider = "VMWare"

  identity_block = {
    type = "SystemAssigned"
  }

  tags = {
    "hello" = "world"
  }
}
```

### Variables:

```bash
- name (Required)
- resource_group_name (Required)
- location (Required)
- distro (Required)
- identity_block (Required)
- infrastructure_provider (Required)
- public_key_base64 (Optional)
- tags (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
- identity
```

###### More information can be found on the official document [azurerm_arc_resource_bridge_appliance](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/arc_resource_bridge_appliance)
