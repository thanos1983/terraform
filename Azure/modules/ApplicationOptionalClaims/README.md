# Manages optional claims for an application registration

## Sample of use:

```bash
resource "azuread_application_registration" "example" {
  display_name = "example"
}

module "application_optional_claims_<project>" {
  source   = "git::https://example.com/application_optional_claims_<my_repo>.git"
  application_id = azuread_application_registration.example.id
  .
  .
  .
}
```

### Variables:

```bash
- access_token_blocks (Optional)
- application_id (Required)
- id_token_blocks (Optional)
- saml2_token_blocks (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azuread_application_optional_claims](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_optional_claims)
