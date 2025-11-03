# Azure Resource Group

## Sample of use:

```bash
module "resource_group_<project>" {
  source  = "git::https://example.com/azure_<my_repo>.git"
  resource_group_name = "my_resource_group_"
  .
  .
  .
}
```

### Variables:

```bash
- resource_group_name - (Required)
- location - (Required)
- timeouts_block (optional)
- tags - (Optional map)
```

### Output:

```bash
- id
- location
- tags
```

### Import the reusable module

In case the user wants to import this resource they need to follow specific syntax. Since we are using reusable modules
the syntax is a combination of the official Azure terraform
documentation [azurerm_resource_group/import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group#import)
and also custom configuration from the function
import [Command: import](https://developer.hashicorp.com/terraform/cli/commands/import). Sample of code:

The following syntax is for cases where the code is not using reusable modules:

```bash
terraform import azurerm_resource_group.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example
```

On the case that the user desires to use this module the code needs to have a different syntax. Sample of code:

```bash
terraform import module.<name of your module>.azurerm_resource_group.resource_group /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example
```

The user should see something like that if the code was executed successfully:

```bash
$ terraform import module.<name of your module>.azurerm_resource_group.resource_group /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example
module.<name of your module>.azurerm_resource_group.resource_group: Importing from ID "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/InfraStructureAsCode"...
module.<name of your module>.azurerm_resource_group.resource_group: Import prepared!
  Prepared azurerm_resource_group for import
module.<name of your module>.azurerm_resource_group.resource_group: Refreshing state... [id=/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```

As soon as the import worked as expected the next time the user will try to apply `terraform plan` the expected output
should look like the following:

```bash
$ terraform plan -out=planOutput
module.<name of your module>.azurerm_resource_group.resource_group: Refreshing state... [id=/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no
differences, so no changes are needed.
```

###### More information can be found on the official document [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)
