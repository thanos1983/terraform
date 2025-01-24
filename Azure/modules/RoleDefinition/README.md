# Assigns a given Principal (User or Group) to a given Role

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
- role_definition_id - (Optional)
- name (Required)
- scope (Required)
- description (Optional)
- permissions_block (Optional)
- assignable_scopes (Optional)
```

### Output:

```bash
- id
- role_definition_id
- role_definition_resource_id
```

###### More information can be found on the official document [azurerm_role_definition](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition)