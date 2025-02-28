# Sysdig Secure Container Rule

## Sample of use:

```bash
module "secure_rule_container_<project>" {
  source     = "git::https://example.com/sysdig_<my_repo>.git"
  name       = "Demo container spawned"
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
- matching (Optional)
- containers (Required)
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

###### More information can be found on the official document [sysdig_secure_rule_container](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/secure_rule_container)