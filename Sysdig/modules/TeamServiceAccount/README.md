# Sysdig Team Service Account

## Sample of use:

```bash
module "group_mapping_<project>" {
  source = "git::https://example.com/sysdig_<my_repo>.git"
  name   = "read only"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- role (Required)
- expiration_date (Required)
- team_id (Required)
- system_role (Optional)
```

### Output:

```bash
- id
- name
- date_created
- expiration_date
- api_key
```

### Provider sysdiglabs/sysdig

Since this module is provided by ``sysdiglabs/sysdig`` we need to add the following on ``versions.tf`` and
``provider.tf``.
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

###### More information can be found on the official document [sysdig_team_service_account](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/team_service_account)
