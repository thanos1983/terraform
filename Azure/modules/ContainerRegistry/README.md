# Azure Application Insights

## Sample of use:

```bash
module "container_registry_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_azurerm_container_registry"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- resource_group_name - (Required)
- location - (Required)
- sku (Required)
- admin_enabled (Optional)
- georeplications_blocks (Optional)
- network_rule_set_block  (Optional)
- public_network_access_enabled (Optional)
- quarantine_policy_enabled (Optional)
- workspace_id_block (Optional)
- trust_policy_block (Optional)
- zone_redundancy_enabled (Optional)
- export_policy_enabled (Optional)
- identity_block (Optional)
- encryption_block (Optional)
- anonymous_pull_enabled (Optional)
- data_endpoint_enabled (Optional)
- network_rule_bypass_option (Optional)
- tags - (Optional)
```

### Output:

```bash
- id
- name
- login_server
- admin_username (sensitive)
- admin_password (sensitive)
- principal_id
- tenant_id
```

###### More information can be found on the official document [azurerm_container_registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry)
