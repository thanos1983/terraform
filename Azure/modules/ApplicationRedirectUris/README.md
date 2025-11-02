# Manages the redirect URIs for an application registration

## Sample of use:

```bash
module "application_redirect_uris_<project>" {
  source   = "git::https://example.com/application_redirect_uris_<my_repo>.git"
  name = "my_application_redirect_uris"
  .
  .
  .
}
```

### Variables:

```bash
- application_id (Required)
- redirect_uris (Required)
- type (Required)
```

### Output:

```bash
- redirect_uris
```

###### More information can be found on the official document [application_redirect_uris](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_redirect_uris)
