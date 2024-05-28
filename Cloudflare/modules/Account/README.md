# Provides a Cloudflare Account resource

## Sample of use:

```bash
module "cloudflare_account_<project>" {
  source = "git::https://example.com/cloudflare_account_<my_repo>.git"
  name   = "my-cloudflare-account"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- enforce_twofactor (Optional)
- type (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [cloudflare_account](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/account)