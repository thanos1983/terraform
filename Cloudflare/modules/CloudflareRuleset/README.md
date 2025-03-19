# Provides a Cloudflare record resource

## Sample of use:

```bash
module "cloudflare_record_<project>" {
  source = "git::https://example.com/cloudflare_record_<my_repo>.git"
  name   = "My ruleset"
  .
  .
  .
}
```

### Variables:

```bash
- kind (Required)
- name (Required)
- phase (Required)
- rules (Required)
- account_id (Optional)
- description (Optional)
- zone_id (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [cloudflare_ruleset](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/ruleset)
