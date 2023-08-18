# Azure Bastion Host

## Sample of use:

```bash
module "bastion_host_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_bastion_host"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resource_group_name - (Required)
- location - (Required)
- copy_paste_enabled - (Optional)
- file_copy_enabled - (Optional)
- sku - (Optional)
- ip_configuration_name - (Required)
- ip_configuration_subnet_id - (Required)
- ip_configuration_public_ip_address_id - (Required)
- ip_connect_enabled - (Optional)
- scale_units - (Optional)
- shareable_link_enabled - (Optional)
- tunneling_enabled - (Optional)
- tags - (Optional)
```

### Output:

```bash
- id
- name
- dns_name
```

###### More information can be found on the official document [azurerm_bastion_host](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host)