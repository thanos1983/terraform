# Azure Virtual Network SubNet

## Sample of use:

```bash
module "virtual_network_subnet_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_network_subnet"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resources_group_name - (Required)
- virtual_network_name - (Required)
- address_prefixes - (Required)
- delegation - (Optional)
- private_endpoint_network_policies_enabled - (Optional)
- private_link_service_network_policies_enabled - (Optional)
- service_endpoints - (Optional)
- service_endpoint_policy_ids - (Optional)
```

### Output:

```bash
- id
- name
- resource_group_name
- virtual_network_name
- address_prefixes
```

###### More information can be found on the official document [azurerm_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)