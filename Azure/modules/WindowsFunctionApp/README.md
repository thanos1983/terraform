# Azure Windows Function App

## Sample of use:

```bash
module "windows_function_app_<project>" {
  source = "git::https://example.com/windows_function_app_<my_repo>.git"
  name   = "my_windows_function_app"
  .
  .
  .
}
```

### Variables:

```bash
- location (Required)
- name (Required)
- resources_group_name (Required)
- service_plan_id (Required)
- site_config_block (Required)
- app_settings (Optional)
- auth_settings_block (Optional)
- auth_settings_v2_block (Optional)
- backup_block (Optional)
- builtin_logging_enabled (Optional)
- client_certificate_enabled (Optional)
- client_certificate_mode (Optional)
- client_certificate_exclusion_paths (Optional)
- connection_string_blocks (Optional)
- content_share_force_disabled (Optional)
- daily_memory_time_quota (Optional)
- enabled (Optional)
- ftp_publish_basic_authentication_enabled (Optional)
- functions_extension_version (Optional)
- https_only (Optional)
- public_network_access_enabled (Optional)
- identity_block (Optional)
- key_vault_reference_identity_id (Optional)
- storage_account_blocks (Optional)
- sticky_settings_block (Optional)
- storage_account_access_key (Optional)
- storage_account_name (Optional)
- storage_uses_managed_identity (Optional)
- storage_key_vault_secret_id (Optional)
- tags (Optional)
- virtual_network_subnet_id (Optional)
- webdeploy_publish_basic_authentication_enabled (Optional)
- zip_deploy_file (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
- custom_domain_verification_id
- default_hostname
- hosting_environment_id
- identity
- kind
- outbound_ip_address_list
- outbound_ip_addresses
- possible_outbound_ip_address_list
- possible_outbound_ip_addresses
- site_credential
```

###### More information can be found on the official document [windows_function_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_function_app)
