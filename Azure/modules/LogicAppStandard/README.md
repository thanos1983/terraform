# Manages a Logic App (Standard / Single Tenant)

## Sample of use:

```bash
module "sample_logic_app_standard_<project>" {
  source   = "git::https://example.com/<my_repo>.git"
  name = "my_logic_app_standard"
  .
  .
}
```

### Variables:

```bash
- name (Required)
- resource_group_name (Required)
- location (Required)
- app_service_plan_id (Required)
- app_settings (Optional)
- use_extension_bundle (Optional)
- bundle_version (Optional)
- connection_string_block (Optional)
- identity_block (Optional)
- site_config_block (Optional)
- client_affinity_enabled (Optional)
- enabled (Optional)
- https_only (Optional)
- storage_account_name (Required)
- storage_account_access_key (Required)
- storage_account_share_name (Optional)
- logic_app_version (Optional)
- virtual_network_subnet_id (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
- custom_domain_verification_id
- default_hostname
- outbound_ip_addresses
- possible_outbound_ip_addresses
- identity
- site_credential
- kind
```

###### More information can be found on the official document [azurerm_logic_app_standard](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/logic_app_standard).