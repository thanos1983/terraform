# Manages a Hybrid Compute Machine Extension

## Sample of use:

```bash
module "arc_machine_extension_<project>" {
  source         = "git::https://example.com/arc_machine_extension_<my_repo>.git"
  name           = "example"
  location       = "West Europe"
  arc_machine_id = data.azurerm_arc_machine.example.id
  publisher      = "Microsoft.Azure.Monitor"
  type           = "AzureMonitorLinuxAgent"
  .
  .
  .
}
```

### Variables:

```bash
- arc_machine_id (Required)
- location (Required)
- name (Required)
- publisher (Required)
- type (Required)
- automatic_upgrade_enabled (Optional)
- force_update_tag (Optional)
- protected_settings (Optional)
- settings (Optional)
- tags (Optional)
- type_handler_version (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_arc_machine_extension](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/arc_machine_extension)
