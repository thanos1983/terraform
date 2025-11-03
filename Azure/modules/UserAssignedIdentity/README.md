# Manages a User Assigned Identity

## Sample of use:

```bash
module "user_assigned_identity_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_user_assigned_identity"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- location (Required)
- resourc_group_name (Required)
- tags (Optional)
```

### Output:

```bash
- id
- name
- client_id
- principal_id
- tenant_id
```

###### More information can be found on the official document [azurerm_user_assigned_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity)
