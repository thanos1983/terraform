# Manages a template deployment of resources

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
- name (Required)
- resources_group_name (Required)
- deployment_mode (Required)
- template_body (Optional)
- parameters (Optional)
- parameters_body (Optional)
```

### Output:

```bash
- id
- name
- outputs
```

###### More information can be found on the official document [template_deployment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/template_deployment)