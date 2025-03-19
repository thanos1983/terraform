# Provides a Cloudflare DNS Record Resource

## Sample of use:

```bash
module "cloudflare_dns_record_<project>" {
  source = "git::https://example.com/cloudflare_dns_record_<my_repo>.git"
  name   = "example.com"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- ttl (Required)
- type (Required)
- zone_id (Required)
- comment (Optional)
- content (Optional)
- data (Optional)
- priority (Optional)
- proxied (Optional)
- settings (Optional)
- tags (Optional)
```

### Output:

```bash
- comment_modified_on
- created_on
- id
- meta
- modified_on
- proxiable
- tags_modified_on
```

###### More information can be found on the official document [cloudflare_dns_record](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)
