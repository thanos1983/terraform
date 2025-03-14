# Azure Application Certificate

## Sample of use:

```bash
resource "azuread_application_registration" "example" {
  display_name = "example"
}

module "application_certificate_<project>" {
  source         = "git::https://example.com/application_certificate_<my_repo>.git"
  application_id = azuread_application_registration.example.id
  type           = "AsymmetricX509Cert"
  value          = file("cert.pem")
  end_date       = "2021-05-01T01:02:03Z"
  .
  .
  .
}
```

### Variables:

```bash
- application_id (Required)
- encoding (Optional)
- end_date (Optional)
- end_date_relative (Optional)
- key_id (Optional)
- start_date (Optional)
- type (Required)
- value (Required)
- timeouts_block (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azuread_application_certificate](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_certificate)