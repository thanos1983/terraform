# Azure Network Security Rule

## Sample of use:

```bash
module "network_security_rule_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_network_security_rule"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resources_group_name (Required)
- network_security_group_name (Required)
- description (Optional)
- protocol (Required)
- source_port_range (Optional)
- source_port_ranges (Optional)
- destination_port_range (Optional)
- destination_port_ranges (Optional)
- source_address_prefix (Optional)
- source_address_prefixes (Optional)
- source_application_security_group_ids (Optional)
- destination_address_prefix (Optional)
- destination_address_prefixes (Optional)
- destination_application_security_group_ids (Optional)
- access (Optional)
- priority (Optional)
- direction (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_network_security_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule.html)
