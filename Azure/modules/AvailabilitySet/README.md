# Azure Availability Set

## Sample of use:

```bash
module "azure_availability_set_<project>" {
  source              = "git::https://example.com/azure_<my_repo>.git"
  name                = "my_availability_set"
  resource_group_name = "AvailabilitySetRG"
  location            = "West Europe"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- resource_group_name (Required)
- location (Required)
- platform_update_domain_count (Optional)
- platform_fault_domain_count (Optional)
- proximity_placement_group_id (Optional)
- managed (Optional)
- tags (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_availability_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/availability_set)