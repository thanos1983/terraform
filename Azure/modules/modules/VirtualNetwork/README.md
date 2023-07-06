# Azure Virtual Network

## Sample of use:

```bash
module "virtual_network_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_network_security_group"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- location (Required)
- resources_group_name (Required)
- security_rule_block (Optional)
- timeouts_block (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network)