# Sysdig Secure Team

## Sample of use:

```bash
module "secure_notification_channel_email_<project>" {
  source     = "git::https://example.com/sysdig_<my_repo>.git"
  name       = "DevOps team"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- description (Optional)
- theme (Optional)
- scope_by (Optional)
- filter (Optional)
- use_sysdig_capture (Optional)
- default_team (Optional)
- user_roles_blocks (Optional)
- zone_ids (Optional)
- all_zones (Optional)
```

### Output:

```bash
- id
- version
- name
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

###### More information can be found on the official document [sysdig_secure_team](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/secure_team)