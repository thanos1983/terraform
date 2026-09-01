# Manages a single owner of an application registration

## Sample of use:

```bash
resource "azuread_application_registration" "example" {
  display_name = "example"
}

resource "azuread_user" "jane" {
  user_principal_name = "jane.fischer@example.com"
  display_name        = "Jane Fischer"
  password            = "Ch@ngeMe"
}


module "application_password_<project>" {
  source          = "git::https://example.com/application_password_<my_repo>.git"
  application_id  = azuread_application_registration.example.id
  owner_object_id = azuread_user.jane.object_id
}
```

### Variables:

```bash
- application_id (Required)
- owner_object_id (Required)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azuread_application_owner](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_owner)
