# Microsoft.App jobs

## Sample of use:

```bash
module "azapi_container_app_job_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_azapi_container_app_job"
  .
  .
  .
}
```

### Variables:

```bash
container_app_environment_id (Required) 
name (Required)
parent_id (Required)
tags (Optional)
identity_block (Optional)
```

### Output:

```bash
id
name
```

### Provider azure/azapi

Since this module is provided by ``azure/azapi`` we need to add the following on ``versions.tf`` and ``provider.tf``.
Sample of ``versions.tf`` file:

````bash
$ cat versions.tf
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.83.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "=1.12.0"
    }
  }
  backend "azurerm" {}
  required_version = ">= 0.13"
}
````

Sample of ``provider.tf`` file:

````bash
$ cat provider.tf
provider "azurerm" {
  features {}
}

provider "azapi" {}
````

###### More information can be found on the official document [containerApps/Microsoft.App jobs](https://learn.microsoft.com/en-us/azure/templates/microsoft.app/jobs?pivots=deployment-language-terraform)