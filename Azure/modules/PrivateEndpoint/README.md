# Manages a Private Endpoint

## Sample of use:

```bash
module "private_endpoint_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_private_endpoint"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- resources_group_name (Required)
- location (Required)
- subnet_id (Required)
- tags - (Optional)
```

### Output:

```bash
- id
- name
- network_interface (block)
- custom_dns_configs (block)
- private_dns_zone_configs (block)
- ip_configuration (block)
```

###### More information can be found on the official document [azurerm_private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint)