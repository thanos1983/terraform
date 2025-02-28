# Sysdig Secure Network Rule

## Sample of use:

```bash
module "secure_rule_network_<project>" {
  source     = "git::https://example.com/sysdig_<my_repo>.git"
  name       = "Disallowed SSH Connection"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- description (Optional)
- tags (Optional)
- block_inbound (Optional)
- block_outbound (Optional)
- tcp_block (Optional)
- udp_block (Optional)
```

### Output:

```bash
- id
- name
- version
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

###### More information can be found on the official document [sysdig_secure_rule_network](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/secure_rule_network)