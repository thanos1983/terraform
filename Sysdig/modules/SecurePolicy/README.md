# Sysdig Secure Policy

## Sample of use:

```bash
module "secure_policy_<project>" {
  source     = "git::https://example.com/sysdig_<my_repo>.git"
  name       = "Write apt database"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- description (Required)
- severity (Optional)
- enabled (Optional)
- type (Optional)
- runbook (Optional)
- scope (Optional)
- actions_blocks (Optional)
- rule_names (Optional)
- notification_channels (Optional)
```

### Output:

```bash
- id
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
      version = "1.46.0"
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

###### More information can be found on the official document [sysdig_secure_policy](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/secure_managed_policy)