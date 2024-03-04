# Manages an application registration within Azure Active Directory

## Sample of use:

```bash
module "application_<project>" {
  source   = "git::https://example.com/application_password_<my_repo>.git"
  name = "my_application"
  .
  .
  .
}
```

### Variables:

```bash
- api_block (Optional)
- app_role_blocks (Optional)
- description (Optional)
- device_only_auth_enabled (Optional)
- display_name (Required)
- fallback_public_client_enabled (Optional)
- feature_tags_block (Optional)
- group_membership_claims (Optional)
- identifier_uris (Optional)
- logo_image (Optional)
- marketing_url (Optional)
- notes (Optional)
- oauth2_post_response_required (Optional)
- optional_claims_block (Optional)
- owners (Optional)
- prevent_duplicate_names (Optional)
- privacy_statement_url (Optional)
- public_client_block (Optional)
- required_resource_access_blocks (Optional)
- service_management_reference (Optional)
- sign_in_audience (Optional)
- single_page_application_block (Optional)
- support_url (Optional)
- tags (Optional)
- template_id (Optional)
- terms_of_service_url (Optional)
- web_block (Optional)
```

### Output:

```bash
- app_role_ids
- client_id
- disabled_by_microsoft
- id
- logo_url
- oauth2_permission_scope_ids
- object_id
- publisher_domain
```

###### More information can be found on the official document [application](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application)