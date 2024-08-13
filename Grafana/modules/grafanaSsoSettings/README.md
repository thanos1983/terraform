# Manages Grafana SSO Settings for OAuth2 and SAML

## Sample of use:

```bash
module "helm_release<project>" {
  source        = "git::https://example.com/grafana_sso_settings_<my_repo>.git"
  provider_name = "azuread"
  .
  .
  .
}
```

### Variables:

```bash
- provider_name (Required)
- oauth2_settings_block (Optional)
- saml_settings_block (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [grafana_sso_settings](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/sso_settings)