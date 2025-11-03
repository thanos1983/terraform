# Manages a Logic App Workflow

## Sample of use:

```bash
module "sample_logic_app_workflow_<project>" {
  source   = "git::https://example.com/<my_repo>.git"
  name = "my_logic_app_workflow"
  .
  .
}
```

### Variables:

```bash
- name (Required)
- resource_group_name (Required)
- location (Required)
- access_control_block (Optional)
- identity_block (Optional)
- integration_service_environment_id (Optional)
- logic_app_integration_account_id (Optional)
- enabled (Optional)
- workflow_parameters (Optional)
- workflow_schema (Optional)
- workflow_version (Optional)
- parameters (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
- access_endpoint
- connector_endpoint_ip_addresses
- connector_outbound_ip_addresses
- identity
- workflow_endpoint_ip_addresses
- workflow_outbound_ip_addresses
```

###### More information can be found on the official document [logic_app_workflow](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/logic_app_workflow)
