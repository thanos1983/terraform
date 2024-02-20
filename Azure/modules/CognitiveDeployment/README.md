# Manages a Cognitive Services Account Deployment

## Sample of use:

```bash
module "cognitive_deployment_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_cognitive_deployment"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- cognitive_account_id (Required)
- model_block (Optional)
- scale_block (Optional)
- rai_policy_name (Optional)
- version_upgrade_option (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
```

    ###### More information can be found on the official document [azurerm_cognitive_deployment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_deployment)