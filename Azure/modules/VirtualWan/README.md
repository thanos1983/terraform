# Azure Virtual WAN

## Sample of use:

```bash
module "virtual_wan_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_virtual_wan"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resources_group_name (Required)
- location (Required)
- disable_vpn_encryption (Optional)
- allow_branch_to_branch_traffic (Optional)
- office365_local_breakout_category (Optional)
- type (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_virtual_wan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_wan)
