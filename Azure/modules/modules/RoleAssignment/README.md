# Azure Storage Account

## Sample of use:

```bash
module "azurerm_role_assignment_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_azurerm_role_assignment"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- scope (Required)
- role_definition_id (Optional)
- role_definition_name (Optional)
- principal_id (Required)
- condition (Optional)
- condition_version (Optional)
- delegated_managed_identity_resource_id (Optional)
- description (Optional)
- skip_service_principal_aad_check (Optional)
```

### Output:

```bash
- id
- name
- principal_type
```

###### More information can be found on the official document [azurerm_role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment)