# Provides a Cloudflare Zone resource

## Sample of use:

```bash
module "cloudflare_zone_<project>" {
  source = "git::https://example.com/cloudflare_zone_<my_repo>.git"
  zone   = "my-cloudflare.com"
  .
  .
  .
}
```

### Variables:

```bash
- account_id (Required)
- zone (Required)
- jump_start (Optional)
- paused (Optional)
- plan (Optional)
- type (Optional)
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

###### More information can be found on the official document [cloudflare_zone](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone)