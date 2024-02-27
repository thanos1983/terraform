# Manages a Private Link Service

## Sample of use:

```bash
module "private_link_service_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_private_link_service"
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
- nat_ip_configuration_block (Required)
- load_balancer_frontend_ip_configuration_ids (Required)
- auto_approval_subscription_ids (Optional)
- enable_proxy_protocol (Optional)
- fqdns (Optional)
- visibility_subscription_ids (Optional)
- tags - (Optional)
```

### Output:

```bash
- id
- name
- alias
```

###### More information can be found on the official document [azurerm_private_link_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_link_service)