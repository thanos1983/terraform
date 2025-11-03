# Azure Subscription

## Sample of use:

```bash
module "my_subscription_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  subscription_name = "My Example EA Subscription"
  .
  .
  .
}
```

### Variables:

```bash
- subscription_name - (Required)
- location (Required)
- resource_group_name (Required)
- tags (Optional)
```

### Output:

```bash
- id
- subscription_name
- tenant_id
```

###### More information can be found on the official document [azurerm_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription)
