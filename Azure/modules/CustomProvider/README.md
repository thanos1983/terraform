# Manages an Azure Custom Provider

## Sample of use:

```bash
module "custom_provider_<project>" {
  source              = "git::https://example.com/custom_provider_<my_repo>.git"
  name                = "example_provider"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- location (Required)
- resource_group_name (Required)
- resource_type_blocks (Optional)
- action_blocks (Optional)
- validation_blocks (Optional)
- tags (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_custom_provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/custom_provider.html)
