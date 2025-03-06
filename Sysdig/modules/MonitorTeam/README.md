# Sysdig Monitor Team

## Sample of use:

```bash
module "monitor_silence_rule_<project>" {
  source = "git::https://example.com/sysdig_<my_repo>.git"
  name   = "Monitoring DevOps team"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- entrypoint_block (Required)
- description (Optional)
- theme (Optional)
- scope_by (Optional)
- filter (Optional)
- can_use_sysdig_capture (Optional)
- can_see_infrastructure_events (Optional)
- can_use_aws_data (Optional)
- user_roles_blocks (Optional)
- default_team (Optional)
- enable_ibm_platform_metrics (Optional)
- ibm_platform_metrics (Optional)
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

###### More information can be found on the official document [sysdig_monitor_team](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/monitor_team)
