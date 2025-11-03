# Azure Virtual Machine Extension

## Sample of use:

```bash
module "virtual_machine_extension_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_virtual_machine_extension"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- virtual_machine_id (Required)
- publisher (Required)
- type (Required)
- type_handler_version (Required)
- auto_upgrade_minor_version (Optional)
- automatic_upgrade_enabled (Optional)
- settings (Optional)
- failure_suppression_enabled (Optional)
- protected_settings (Optional)
- protected_settings_from_key_vault_block (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_virtual_machine_extension](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension.html)
