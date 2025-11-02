# Manages a password credential associated with an application within Azure Active Directory

## Sample of use:

```bash
module "application_password_<project>" {
  source   = "git::https://example.com/application_password_<my_repo>.git"
  name = "my_application_password"
  .
  .
  .
}
```

### Variables:

```bash
- application_id (Required)
- display_name (Optional)
- end_date (Optional)
- end_date_relative (Optional)
- rotate_when_changed (Optional)
- start_date (Optional)
- key_vault_id (Optional)
- tags (Optional)
```

### Output:

```bash
- key_id
- value
```

###### More information can be found on the official document [application_password](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password)
