# Provides a resource which customizes Cloudflare zone settings

## Sample of use:

```bash
module "cloudflare_zone_settings_override_<project>" {
  source  = "git::https://example.com/cloudflare_zone_settings_override_<my_repo>.git"
  zone_id = var.zone_id
  .
  .
  .
}
```

### Variables:

```bash
- zone_id (Required)
- settings_block (Optional)
```

### Output:

```bash
- id
- meta
- name_servers
- status
- vanity_name_servers
- verification_key
```

###### More information can be found on the official document [cloudflare_zone_settings_override](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_settings_override)