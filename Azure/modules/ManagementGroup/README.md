# Azure Management Group

## Sample of use:

```bash
module "management_group_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_management_group"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Optional)
- display_name (Optional)
- parent_management_group_id (Optional)
- subscription_ids (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [management_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group)