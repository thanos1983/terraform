# Sysdig Monitor Alert V2 Metric

## Sample of use:

```bash
module "monitor_alert_v2_metric_<project>" {
  source = "git::https://example.com/sysdig_<my_repo>.git"
  name   = "High cpu used"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- description (Optional)
- range_seconds (Optional)
- duration_seconds (Optional)
- group (Optional)
- severity (Optional)
- enabled (Optional)
- notification_channels_blocks (Optional)
- custom_notification_block (Optional)
- link_blocks (Optional)
- labels (Optional)
- capture_block (Optional)
- scope_blocks (Optional)
- group_by (Optional)
- metric (Required)
- time_aggregation (Required)
- group_aggregation (Required)
- operator (Required)
- threshold (Required)
- warning_threshold (Optional)
- no_data_behaviour (Optional)
- unreported_alert_notifications_retention_seconds (Optional)
```

### Output:

```bash
- id
- team
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

###### More information can be found on the official document [sysdig_monitor_alert_v2_metric](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/monitor_alert_v2_metric)
