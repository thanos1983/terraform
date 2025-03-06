# Sysdig Agent Access Key

## Sample of use:

```bash
module "group_mapping_<project>" {
  source      = "git::https://example.com/sysdig_<my_repo>.git"
  limit       = 11
  reservation = 1
  team_id     = 50012099
  metadata = {
    "test" = "yes"
    "environment" = "development"
    "team" = "awesome_team"
  }
  enabled = true
}
```

### Variables:

```bash
- metadata (Optional)
- team_id (Optional)
- limit (Optional)
- reservation (Optional)
- enabled (Optional)
```

### Output:

```bash
- id
- access_key
- date_disabled
- date_created
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

###### More information can be found on the official document [sysdig_agent_access_key](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/agent_access_key)