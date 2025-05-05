# Manages a Hybrid Compute Machine

## Sample of use:

```bash
module "arc_machine_<project>" {
  source              = "git::https://example.com/arc_machine_<my_repo>.git"
  name                = "my_arc_name"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  kind                = "SCVMM"
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
- kind (Required)
- identity_block (Optional)
- tags (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- identity
```

###### More information can be found on the official document [azurerm_arc_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/arc_machine)
