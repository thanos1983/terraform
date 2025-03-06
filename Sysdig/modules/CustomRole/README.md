# Sysdig Custom Role

## Sample of use:

```bash
module "custom_role_<project>" {
  source = "git::https://example.com/sysdig_<my_repo>.git"
  name = "custom-role-name"
  description = "test"

  permissions_block = {
    monitor_permissions = ["kubernetes-api-commands.read"]
    secure_permissions = ["scanning.read"]
  }
}
```

### Variables:

```bash
- name (Required)
- description (Optional)
- permissions_block (Required)
```

### Output:

```bash
- id
- name
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

###### More information can be found on the official document [sysdig_custom_role](https://registry.terraform.io/providers/sysdiglabs/sysdig/latest/docs/resources/custom_role)