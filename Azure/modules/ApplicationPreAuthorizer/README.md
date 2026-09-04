# Manages client applications that are pre-authorized with the specified permissions to access an application's APIs without requiring user consent

## Sample of use:

```bash
module "application_pre_authorized_<project>" {
  source   = "git::https://example.com/application_pre_authorized_<my_repo>.git"
  name = "my_application_pre_authorized"
  .
  .
  .
}
```

### Variables:

```bash
- application_id (Required)
- authorized_client_id (Required)
- permission_ids (Required)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azuread_application_pre_authorized](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_pre_authorized)