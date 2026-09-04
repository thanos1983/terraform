# Manages a permission scope for an application registration

## Sample of use:

```bash
module "application_permission_scope_<project>" {
  source   = "git::https://example.com/application_permission_scope_<my_repo>.git"
  name = "my_application_permission_scope"
  .
  .
  .
}
```

### Variables:

```bash
- admin_consent_description (Required)
- admin_consent_display_name (Required)
- application_id (Required)
- scope_id (Required)
- type (Required)
- user_consent_description (Required)
- user_consent_display_name (Required)
- value (Required)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azuread_application_permission_scope](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_permission_scope)