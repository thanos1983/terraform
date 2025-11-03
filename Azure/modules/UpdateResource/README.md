# Update Resource

## Sample of use:

```bash
module "azapi_update_resource_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_update_resource"
  .
  .
  .
}
```

### Variables:

```bash
- type (Required)
- body (Required)
- ignore_casing (Optional)
- ignore_missing_property (Optional)
- locks (Optional)
- name (Optional)
- parent_id (Optional)
- read_headers (Optional)
- read_query_parameters (Optional)
- resource_id (Optional)
- response_export_values (Optional)
- retry_block (Optional)
- sensitive_body (Optional)
- sensitive_body_version (Optional)
- update_headers (Optional)
- update_query_parameters (Optional)
- timeouts_block (Optional)
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

###### More information can be found on the official document [azapi_update_resource](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/azapi_update_resource)
