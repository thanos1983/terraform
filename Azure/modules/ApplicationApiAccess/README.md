# Manages the API permissions for an application registration

## Sample of use:

```bash
module "application_api_access_<project>" {
  source   = "git::https://example.com/application_api_access_<my_repo>.git"
  application_id = "application_id"
  .
  .
  .
}
```

### Variables:

```bash
- api_client_id (Required)
- application_id (Required)
- role_ids (Optional)
- scope_ids (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [application_api_access](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_api_access)