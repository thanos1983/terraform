# Manages an API Management Service

## Sample of use:

```bash
module "api_management_<project>" {
  source   = "git::https://example.com/api_management_<my_repo>.git"
  name     = "my_api_management"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- location (Required)
- resource_group_name (Required)
- publisher_name (Required)
- publisher_email (Required)
- sku_name (Required)
- additional_location_blocks (Optional)
- certificate_blocks (Optional)
- client_certificate_enabled (Optional)
- delegation_block (Optional)
- gateway_disabled (Optional)
- min_api_version (Optional)
- zones (Optional)
- identity_block (Optional)
- hostname_configuration_block (Optional)
- notification_sender_email (Optional)
- protocols_block (Optional)
- security_block (Optional)
- sign_in_block (Optional)
- sign_up_block (Optional)
- tenant_access_block (Optional)
- public_ip_address_id (Optional)
- public_network_access_enabled (Optional)
- virtual_network_type (Optional)
- virtual_network_configuration_block (Optional)
- tags (Optional)
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

###### More information can be found on the official document [api_management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management)