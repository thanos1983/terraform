# Manages a delegated permission grant for a service principal, on behalf of a single user, or all users

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
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["openid"]
      type = "Scope"
    }

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["User.Read"]
      type = "Scope"
    }
  }
}

resource "azuread_service_principal" "example" {
  client_id = azuread_application.example.client_id
}

module "service_principal_delegated_permission_grant_<project>" {
  source  = "git::https://example.com/service_principal_delegated_permission_grant_<my_repo>.git"
  service_principal_object_id          = azuread_service_principal.example.object_id
  resource_service_principal_object_id = azuread_service_principal.msgraph.object_id
  claim_values                         = ["openid", "User.Read.All"]
}
```

### Variables:

```bash
- claim_values - (Required)
- resource_service_principal_object_id - (Required)
- service_principal_object_id - (Required)
- user_object_id - (Optional)
- timeouts - (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azuread_service_principal_delegated_permission_grant](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal_delegated_permission_grant)
