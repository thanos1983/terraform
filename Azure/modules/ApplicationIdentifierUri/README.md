# Manages a single Identifier URI for an application registration

## Sample of use:

```bash
module "application_identifier_uri_<project>" {
  source   = "git::https://example.com/application_identifier_uri_<my_repo>.git"
  name = "my_application_identifier_uri"
  .
  .
  .
}
```

### Variables:

```bash
- application_id (Required)
- identifier_uri (Required)
```

### Output:

```bash
- identifier_uri
```

###### More information can be found on the official document [application_identifier_uri](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_identifier_uri)