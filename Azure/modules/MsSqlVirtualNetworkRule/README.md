# Allows you to manage rules for allowing traffic between an Azure SQL server and a subnet of a virtual network

## Sample of use:

```bash
module "my_mssql_virtual_network_rule_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "my_mssql_virtual_network_rule"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- server_id (Required)
- subnet_id (Required)  
- ignore_missing_vnet_service_endpoint (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_mssql_virtual_network_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_virtual_network_rule)
