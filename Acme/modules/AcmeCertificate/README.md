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

module "acme_certificate_<project>" {
  source          = "git::https://example.com/acme_certificate_<my_repo>.git"
  account_key_pem = module.acme_registration_<project>.account_key_pem
  .
  .
  .
}
```

### Variables:

```bash
- account_key_pem (Required)
- common_name (Optional)
- subject_alternative_names (Optional)
- key_type (Optional)
- dns_challenge_blocks (Optional)
- recursive_nameservers (Optional)
- disable_complete_propagation (Optional)
- pre_check_delay (Optional)
- http_challenge_block (Optional)
- http_webroot_challenge_block (Optional)
- http_memcached_challenge_block (Optional)
- http_s3_challenge_block (Optional)
- tls_challenge_block (Optional)
- must_staple (Optional)
- min_days_remaining (Optional)
- certificate_p12_password (Optional)
- preferred_chain (Optional)
- revoke_certificate_on_destroy (Optional)
- revoke_certificate_reason (Optional)
- cert_timeout (Optional)
```

### Output:

```bash
- id
- certificate_url
- certificate_domain
- private_key_pem
- certificate_pem
- issuer_pem
- certificate_p12
- certificate_not_after
```

###### More information can be found on the official document [acme_registration](https://registry.terraform.io/providers/vancluever/acme/latest/docs/resources/registration)