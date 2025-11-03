# Azure Data Factory Dataset Azure SQL

## Sample of use:

```bash
module "data_factory_dataset_azure_sql_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  name = "data_factory_dataset_azure_sql"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- data_factory_id (Required)
- propertiesAnnotations (Optional)
- propertiesDescription (Optional)
- propertiesFolder (Optional)
- linkedServiceParameters (Optional)
- linkedServiceReferenceName (Required)
- linkedServiceType (Required)
- propertiesParameters (optional)
- propertiesSchema (optional)
- propertiesStructure (Optional)
- propertiesType (Optional)
- propertiesTypePropertiesSchema (Optional)
- propertiesTypePropertiesTable (Optional block)
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
      version = "=3.59.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "=1.6.0"
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

###### More information can be found on the official document [Microsoft.DataFactory factories/datasets](https://learn.microsoft.com/en-us/azure/templates/microsoft.datafactory/factories/datasets?pivots=deployment-language-terraform)
