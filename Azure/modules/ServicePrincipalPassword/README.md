# Manages a password credential associated with a service principal within Azure Active Directory

## Sample of use:

```bash
module "service_principal_password_<project>" {
  source  = "git::https://example.com/shared_image_<my_repo>.git"
  name = "my_service_principal_password"
  .
  .
  .
}
```

### Variables:

```bash
- display_name - (Optional)
- end_date - (Optional)
- end_date_relative - (Optional)
- rotate_when_changed - (Optional)
- service_principal_id - (Required)
- start_date - (Optional)
```

### Output:

```bash
- key_id
- value
```

###### More information can be found on the official document [azuread_service_principal_password](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal_password)