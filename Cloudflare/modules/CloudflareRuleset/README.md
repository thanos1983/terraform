# Provides a Cloudflare record resource

## Sample of use:

```bash
module "cloudflare_record_<project>" {
  source = "git::https://example.com/cloudflare_record_<my_repo>.git"
  name   = "my-cloudflare_record"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- type (Required)
- zone_id (Required)
- allow_overwrite (Optional)
- comment (Optional)
- data_block (Optional)
- priority (Optional)
- proxied (Optional)
- tags (Optional)
- timeouts (Optional)
- ttl (Optional)
- value (Optional)
```

### Output:

```bash
- created_on
- hostname
- id
- metadata
- modified_on
- proxiable
```

###### More information can be found on the official document [cloudflare_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record)