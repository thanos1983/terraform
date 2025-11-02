# Manages an application registration within Azure Active Directory

## Sample of use:

```bash
module "application_registration_<project>" {
  source   = "git::https://example.com/application_password_<my_repo>.git"
  name = "my_application_registration"
  .
  .
  .
}
```

### Variables:

```bash
- description (Optional)
- display_name (Required)
- group_membership_claims (Optional)
- homepage_url (Optional)
- implicit_access_token_issuance_enabled (Optional)
- implicit_id_token_issuance_enabled (Optional)
- logout_url (Optional)
- marketing_url (Optional)
- notes (Optional)
- privacy_statement_url (Optional)
- requested_access_token_version (Optional)
- service_management_reference (Optional)
- sign_in_audience (Optional)
- support_url (Optional)
- terms_of_service_url (Optional)
```

### Output:

```bash
- client_id
- disabled_by_microsoft
- id
- object_id
- publisher_domain
```

###### More information can be found on the official document [application_registration](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_registration)
