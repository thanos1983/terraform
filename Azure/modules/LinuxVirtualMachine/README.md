# Azure Linux Virtual Machine

## Sample of use:

```bash
module "linux_virtual_machine_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_linux_virtual_machine"
  .
  .
  .
}
```

### Variables:

```bash
- admin_password - (Required)
- admin_username - (Required)
- location - (Required)
- name - (Required)
- network_interface_ids - (Required)
- os_disk - (Required)
- resources_group_name - (Required)
- size - (Required)
- additional_capabilities - (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_linux_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine)