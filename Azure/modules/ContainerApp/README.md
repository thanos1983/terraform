# Manages a Container App

## Sample of use:

```bash
module "container_app_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_container_app"
  .
  .
  .
}
```

### Variables:

```bash
- container_app_environment_id (Required)
- name (Required)
- resource_group_name (Required)
- revision_mode (Required)
- template_block (Required)
- dapr_block (Optional)
- identity_block (Optional)
- ingress_block (Optional)
- registry_block (Optional)
- secret_block (Optional)
- workload_profile_name (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
- custom_domain_verification_id
- latest_revision_fqdn
- latest_revision_name
- location
- outbound_ip_addresses
```

###### More information can be found on the official document [azurerm_container_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app)

