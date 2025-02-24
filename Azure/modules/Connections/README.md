# Web Connections

## Sample of use:

```bash
module "azapi_connections_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_azapi_connections"
  .
  .
  .
}
```

### Variables:

```bash
- type (Optional)
- name (Required)
- location (Optional)
- parent_id (Required)
- tags (Optional)
- api (Required)
- customParameterValues (Optional)
- displayName (Optional)
- nonSecretParameterValues (Optional)
- parameterValues (Optional)
- statuses (Optional)
- testLinks (Optional)
```

### Output:

```bash
- id
- name
- output
```

### Provider azure/azapi

Since this module is provided by ``azure/azapi`` we need to add the following on ``versions.tf`` and ``provider.tf``.
Sample of ``versions.tf`` file:

````bash
$ cat versions.tf
terraform {
  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "=1.12.1"
    }
  }
  backend "azurerm" {}
  required_version = ">= 0.13"
}
````

Sample of ``provider.tf`` file:

````bash
$ cat provider.tf
provider "azapi" {}
````

###### More information can be found on the official document [microsoft.web/connections](https://learn.microsoft.com/en-us/azure/templates/microsoft.web/connections?pivots=deployment-language-terraform)