# Manages a Container App Environment Storage

## Sample of use:

```bash
module "container_app_environment_storage_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_container_app_environment_storage"
  .
  .
  .
}
```

### Variables:

```bash 
- name (Required)
- container_app_environment_id (Required)
- account_name (Required)
- share_name (Required)
- access_mode (Required)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azurerm_container_app_environment_storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app_environment_storage)
