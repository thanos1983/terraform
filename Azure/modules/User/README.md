# Manages a single group membership within Azure Active Directory

## Sample of use:

```bash
module "azuread_user_<project>" {
  source              = "git::https://example.com/azuread_user_<my_repo>.git"
  display_name        = "J. Doe"
  user_principal_name = "jdoe@hashicorp.com"
}
```

### Variables:

```bash
- account_enabled (Optional)
- age_group (Optional)
- business_phones (Optional)
- city (Optional)
- company_name (Optional)
- consent_provided_for_minor (Optional)
- cost_center (Optional)
- country (Optional)
- department (Optional)
- disable_password_expiration (Optional)
- disable_strong_password (Optional)
- display_name (Required)
- division (Optional)
- employee_id (Optional)
- employee_type (Optional)
- fax_number (Optional)
- force_password_change (Optional)
- given_name (Optional)
- job_title (Optional)
- mail (Optional)
- mail_nickname (Optional)
- manager_id (Optional)
- mobile_phone (Optional)
- office_location (Optional)
- onpremises_immutable_id (Optional)
- other_mails (Optional)
- password (Optional)
- postal_code (Optional)
- preferred_language (Optional)
- show_in_address_list (Optional)
- state (Optional)
- street_address (Optional)
- surname (Optional)
- usage_location (Optional)
- user_principal_name (Required)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- creation_type
- external_user_state
- im_addresses
- object_id
- onpremises_distinguished_name
- onpremises_domain_name
- onpremises_sam_account_name
- onpremises_security_identifier
- onpremises_sync_enabled
- onpremises_user_principal_name
- proxy_addresses
- user_type
```

###### More information can be found on the official document [azuread_user](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/user)
