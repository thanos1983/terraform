# Manages a service principal associated with an application within Azure Active Directory

## Sample of use:

```bash
module "service_principal_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_service_principal"
  .
  .
  .
}
```

### Variables:

```bash
- account_enabled - (Optional)
- alternative_names (Optional)
- app_role_assignment_required (Optional)
- client_id (Required)
- description (Optional)
- feature_tags_block (Optional)
- login_url (Optional)
- notes (Optional)
- notification_email_addresses (Optional)
- owners (Optional)
- preferred_single_sign_on_mode (Optional)
- saml_single_sign_on_block (Optional)
- use_existing (Optional)
- tags (Optional)
- display_name (Optional)
- end_date (Optional)
- end_date_relative (Optional)
- rotate_when_changed (Optional)
- start_date (Optional)
```

### Output:

```bash
- app_role_ids
- app_roles
- application_tenant_id
- display_name
- homepage_url
- logout_url
- oauth2_permission_scope_ids
- oauth2_permission_scopes
- object_id
- redirect_uris
- saml_metadata_url
- service_principal_names
- sign_in_audience
- type
```

###### More information can be found on the official document [service_principal](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal)