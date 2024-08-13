# The acme_registration resource can be used to create and manage accounts on an ACME server.

## Sample of use:

```bash
module "acme_registration_<project>" {
  source = "git::https://example.com/acme_registration_<my_repo>.git"
  email  = "nobody@example.com"
  .
  .
  .
}
```

### Variables:

```bash
- account_key_pem (Optional)
- account_key_algorithm (Optional)
- account_key_ecdsa_curve (Optional)
- account_key_rsa_bits (Optional)
- email (Required)
- external_account_binding_block (Optional)
```

### Output:

```bash
- id
- account_key_pem
- registration_url
```

###### More information can be found on the official document [acme_registration](https://registry.terraform.io/providers/vancluever/acme/latest/docs/resources/registration)