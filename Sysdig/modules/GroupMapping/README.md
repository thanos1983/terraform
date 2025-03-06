# Sysdig Group Mapping

## Sample of use:

```bash
module "group_mapping_<project>" {
  source     = "git::https://example.com/sysdig_<my_repo>.git"
  group_name = "my-group"
  .
  .
  .
}
```

### Variables:

```bash
- group_name (Required)
- role (Required)
- system_role (Optional)
- team_map_block (Required)
- weight (Optional)
```

### Output:

```bash
- id
- group_name
```

### Provider sysdiglabs/sysdig

Since this module is provided by ``sysdiglabs/sysdig`` we need to add the following on ``versions.tf`` and ``provider.tf``.
Sample of ``versions.tf`` file:

````bash
$ cat versions.tf
terraform {
  required_providers {
    sysdig = {
      source = "sysdiglabs/sysdig"
      version = "1.47.0"
    }
  }
  backend "azurerm" {}
  required_version = ">= 0.13"
}
````

Sample of ``provider.tf`` file:

````bash
$ cat provider.tf
provider "sysdig" {}
````

###### More information can be found on the official document [sysdig_group_mapping](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/group_mapping)