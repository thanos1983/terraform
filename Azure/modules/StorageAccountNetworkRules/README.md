# Azure Storage Account Network Rules

## Sample of use:

```bash
module "storage_account_network_rules_<project>" {
  source             = "git::https://example.com/storage_account_network_rules_<my_repo>.git"
  storage_account_id = <...>
  .
  .
  .
}
```

### Variables:

```bash
- storage_account_id (Required)
- default_action (Required)
- bypass (Optional)
- ip_rules (Optional)
- virtual_network_subnet_ids (Optional)
- private_link_access_blocks (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [storage_account_network_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules)
