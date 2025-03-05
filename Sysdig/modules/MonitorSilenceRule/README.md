# Sysdig Monitor Silence Rule

## Sample of use:

```bash
module "monitor_silence_rule_<project>" {
  source     = "git::https://example.com/sysdig_<my_repo>.git"
  name       = "Example Silence Rule"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- enabled (Optional)
- start_ts (Required)
- duration_seconds (Required)
- scope (Optional)
- alert_ids (Optional)
- notification_channel_ids (Optional)
```

### Output:

```bash
- id
- version
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

###### More information can be found on the official document [sysdig_monitor_silence_rule](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/monitor_silence_rule)
