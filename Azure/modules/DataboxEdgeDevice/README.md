# Manages a Databox Edge Device

## Sample of use:

```bash
module "databox_edge_device_<project>" {
  source              = "git::https://example.com/databox_edge_device_<my_repo>.git"
  name                = "example-device"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku_name            = "EdgeP_Base-Standard"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- resource_group_name (Required)
- location (Required)
- sku_name (Required)
- tags (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
- device_properties
```

###### More information can be found on the official document [azurerm_databox_edge_device](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databox_edge_device)
