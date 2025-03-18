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
- account_block (Required)
- name (Required)
- type (Optional)
- vanity_name_servers (Optional)
```

### Output:

```bash
- activated_on
- created_on
- development_mode
- id
- meta
- modified_on
- name_servers
- original_dnshost
- original_name_servers
- original_registrar
- owner
- paused
- status
- verification_key
```

###### More information can be found on the official document [cloudflare_zone](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone)