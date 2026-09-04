# Manages an app role assignment for a group, user or service principal

## Sample of use:

```bash
data "azuread_application_published_app_ids" "well_known" {}

resource "azuread_service_principal" "msgraph" {
  client_id    = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph
  use_existing = true
}

resource "azuread_application" "example" {
  display_name = "example"

  required_resource_access {
    resource_app_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph

    resource_access {
      id   = azuread_service_principal.msgraph.app_role_ids["User.Read.All"]
      type = "Role"
    }

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["User.ReadWrite"]
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "example" {
  client_id = azuread_application.example.client_id
}

module "app_role_assignment_<project>" {
  source              = "git::https://example.com/app_role_assignment_<my_repo>.git"
  app_role_id         = azuread_service_principal.msgraph.app_role_ids["User.Read.All"]
  principal_object_id = azuread_service_principal.example.object_id
  resource_object_id  = azuread_service_principal.msgraph.object_id
}
```

### Variables:

```bash
- app_role_id (Required)
- principal_object_id (Required)
- resource_object_id (Required)
- timeouts (Optional)
```

### Output:

```bash
- principal_display_name
- principal_type
- resource_display_name
```

###### More information can be found on the official document [azuread_app_role_assignment](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/app_role_assignment)
