# Manages a group within Azure Active Directory

## Sample of use:

```bash
module "azuread_group_<project>" {
  source           = "git::https://example.com/azuread_group_<my_repo>.git"
  display_name     = "example"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
  .
  .
  .
}
```

### Variables:

```bash
- administrative_unit_ids (Optional)
- assignable_to_role (Optional)
- auto_subscribe_new_members (Optional)
- behaviors (Optional)
- description (Optional)
- display_name (Required)
- dynamic_membership_block (Optional)
- external_senders_allowed (Optional)
- hide_from_address_lists (Optional)
- hide_from_outlook_clients (Optional)
- mail_enabled (Optional)
- mail_nickname (Optional)
- members (Optional)
- onpremises_group_type (Optional)
- owners (Optional)
- prevent_duplicate_names (Optional)
- provisioning_options (Optional)
- security_enabled (Optional)
- theme (Optional)
- types (Optional)
- visibility (Optional)
- writeback_enabled (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
- additional_location
- gateway_url
- gateway_regional_url
- identity
- hostname_configuration
- management_api_url
- portal_url
- developer_portal_url
- public_ip_addresses
- private_ip_addresses
- scm_url
- tenant_access
```

###### More information can be found on the official document [azuread_group](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group)
