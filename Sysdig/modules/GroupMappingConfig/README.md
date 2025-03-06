# Sysdig Group Mapping Config

## Sample of use:

```bash
module "group_mapping_config<project>" {
  source                            = "git::https://example.com/sysdig_<my_repo>.git"
  no_mapping_strategy               = var.no_mapping_strategy
  different_team_same_role_strategy = var.different_team_same_role_strategy
}
```

### Variables:

```bash
- no_mapping_strategy (Required)
- different_team_same_role_strategy (Required)
```

### Output:

```bash
- id
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

###### More information can be found on the official document [sysdig_group_mapping_config](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/group_mapping_config)