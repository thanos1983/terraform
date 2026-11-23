# Subnet Service Endpoint Storage Policy

## Sample of use:

```bash
module "subnet_service_endpoint_storage_policy_<project>" {
  source = "git::https://example.com/azure_<my_repo>.git"
  name   = "my_subnet_service_endpoint_storage_policy"
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
- definition_block (Optional)
- tags (Required)
```

###### More information can be found on the official document [azurerm_subnet_service_endpoint_storage_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_service_endpoint_storage_policy)