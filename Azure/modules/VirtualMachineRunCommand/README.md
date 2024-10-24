# Azure Virtual Machine Run Command

## Sample of use:

```bash
module "virtual_machine_run_command_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_virtual_machine_run_command"
  .
  .
  .
}
```

### Variables:

```bash
- location (Required)
- name (Required)
- virtual_machine_id (Required)
- source_block (Required)
- error_blob_managed_identity_block (Optional)
- error_blob_uri (Optional)
- output_blob_managed_identity_block (Optional)
- output_blob_uri (Optional)
- parameter_blocks (Optional)
- protected_parameter_blocks (Optional)
- run_as_password (Optional)
- run_as_user (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [virtual_machine_run_command](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_run_command)