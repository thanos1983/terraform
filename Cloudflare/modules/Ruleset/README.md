# Provides a Cloudflare record resource

## Sample of use:

```bash
module "cloudflare_record_<project>" {
  source  = "git::https://example.com/cloudflare_record_<my_repo>.git"
  name    = "Redirect rules ruleset"
  kind    = "zone"
  phase   = "http_request_dynamic_redirect"
  zone_id = var.CLOUDFLARE_ZONE_ID
  rules = [
    {
      action = "redirect"
      action_parameters = {
        from_value = {
          status_code = 301
          target_url = {
            value = "https://www.${var.zone}"
          }
          preserve_query_string = true
        }
      }
      enabled     = true
      expression  = "http.host eq \"${var.zone}\""
      description = "Redirect all requests from ${var.zone} to www.${var.zone}"
    }
  ]
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
