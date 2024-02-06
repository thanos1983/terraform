# Manages a Container App Environment Certificate

## Sample of use:

```bash
module "container_app_environment_certificate_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_container_app_environment_certificate"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- container_app_environment_id (Required)
- certificate_blob_base64 (Required)
- certificate_password (Required)
- tags - (Optional)
```

### Output:

```bash
- id
- name
- expiration_date
- issue_date
- issuer
- subject_name
- thumbprint
```

###### More information can be found on the official document [azurerm_container_app_environment_certificate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app_environment_certificate)