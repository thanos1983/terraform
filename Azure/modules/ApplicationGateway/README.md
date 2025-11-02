# Manages an Application Gateway

## Sample of use:

```bash
module "application_gw_<project>" {
  source   = "git::https://example.com/application_gw_<my_repo>.git"
  name     = "my_application_gw"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- resource_group_name (Required)
- location (Required)
- backend_address_pool_blocks (Required)
- backend_http_settings_blocks (Required)
- frontend_ip_configuration_blocks (Required)
- frontend_port_blocks (Required)
- gateway_ip_configuration_blocks (Required)
- http_listener_blocks (Required)
- request_routing_rule_blocks (Required)
- sku_block (Required)
- fips_enabled (Optional)
- global_block (Optional)
- identity_block (Optional)
- private_link_configuration_blocks (Optional)
- zones (Optional)
- trusted_client_certificate_blocks (Optional)
- ssl_profile_blocks (Optional)
- authentication_certificate_blocks (Optional)
- trusted_root_certificate_blocks (Optional)
- ssl_policy_blocks (Optional)
- enable_http2 (Optional)
- force_firewall_policy_association (Optional)
- probe_blocks (Optional)
- ssl_certificate_blocks (Optional)
- tags (Optional)
- url_path_map_blocks (Optional)
- waf_configuration_block (Optional)
- custom_error_configuration_blocks (Optional)
- firewall_policy_id (Optional)
- redirect_configuration_blocks (Optional)
- autoscale_configuration_block (Optional)
- rewrite_rule_set_blocks (Optional)
```

### Output:

```bash
- id
- authentication_certificate
- backend_address_pool
- backend_http_settings
- frontend_ip_configuration
- frontend_port
- gateway_ip_configuration
- http_listener
- private_endpoint_connection
- private_link_configuration
- probe
- request_routing_rule
- ssl_certificate
- url_path_map
- custom_error_configuration
- redirect_configuration
```

###### More information can be found on the official document [azurerm_application_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway)
