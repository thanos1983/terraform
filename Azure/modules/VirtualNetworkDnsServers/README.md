# Azure Virtual Network DNS Servers

## Sample of use:

```bash
module "virtual_network_dns_servers_<project>" {
  source            = "git::https://example.com/azure_<my_repo>.git"
  virtual_network_id = <the virtual_network_id >
  .
  .
  .
}
```

### Variables:

```bash
- virtual_network_id - (Required)
- dns_servers - (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azurerm_virtual_network_dns_servers](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_dns_servers)