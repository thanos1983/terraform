# Microsoft.App containerApps/authConfigs

## Sample of use:

```bash
module "azapi_containerApps_authConfigs_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_azapi_containerApps_authConfigs"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- parent_id (Required)
- globalValidation (Optional)
- httpSettings (Optional) 
- apple (Optional)
- azureActiveDirectory (Optional)
- azureStaticWebApps (Optional)
- customOpenIdConnectProviders (Optional)
- facebook (Optional)
- gitHub (Optional)
- google (Optional)
- twitter (Optional)
- login (Optional)
- platform (Optional)
```

### Output:

```bash
- id
- name
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

###### More information can be found on the official document [Microsoft.App/containerApps/authConfigs](https://learn.microsoft.com/en-us/azure/templates/microsoft.app/containerapps/authconfigs?pivots=deployment-language-terraform)
