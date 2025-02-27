# Sysdig Secure Managed Policy

## Sample of use:

```bash
module "secure_managed_policy_<project>" {
  source     = "git::https://example.com/sysdig_<my_repo>.git"
  name       = "Sysdig Runtime Threat Detection"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- type (Optional)
- enabled (Optional)
- runbook (Optional)
- scope (Optional)
- actions_blocks (Optional)
- disabled_rules (Optional)
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

###### More information can be found on the official document [sysdig_secure_managed_policy](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/secure_managed_policy)