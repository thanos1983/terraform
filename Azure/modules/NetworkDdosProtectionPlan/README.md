# Azure Network DDOS Protection Plan

## Sample of use:

```bash
module "network_ddos_protection_plan_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- location - (Required)
- resource_group_name - (Required)
- tags - (Optional)
```

### Output:

```bash
- id
- name
- virtual_network_ids
```

###### More information can be found on the official document [network_ddos_protection_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_ddos_protection_plan.html)
