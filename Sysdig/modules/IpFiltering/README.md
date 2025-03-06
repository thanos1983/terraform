# Sysdig IP Filtering

## Sample of use:

```bash
module "ip_filter_<project>" {
  source   = "git::https://example.com/sysdig_<my_repo>.git"
  ip_range = "192.168.100.0/24"
  .
  .
  .
}
```

### Variables:

```bash
- ip_range (Required)
- enabled (Required)
- note (Optional)
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

###### More information can be found on the official document [sysdig_ip_filter](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/ip_filter)
