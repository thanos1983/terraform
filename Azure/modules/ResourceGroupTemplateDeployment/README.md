# Manages a Resource Group Template Deployment

## Sample of use:

```bash
module "template_deployment_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_template_deployment"
  .
  .
  .
}
```

### Variables:

```bash
- deployment_mode (Required)
- name (Required)
- resources_group_name (Required)
- debug_level (Optional)
- template_content (Optional)
- template_spec_version_id (Optional)
- parameters_content (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
- output_content
```

###### More information can be found on the official document [resource_group_template_deployment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment)
