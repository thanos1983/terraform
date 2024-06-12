# Provides a resource which manages Cloudflare API tokens

## Sample of use:

```bash
module "cloudflare_api_token_<project>" {
  source = "git::https://example.com/cloudflare_api_token_<my_repo>.git"
  name          = "api_token_cloudflare_external_dns"
  policy_blocks = [
    {
      permission_groups = [
        data.cloudflare_api_token_permission_groups.all.zone["DNS Write"],
        data.cloudflare_api_token_permission_groups.all.zone["Zone Read"]
      ]
      resources = {
        "com.cloudflare.api.account.zone.*" = "*"
      }
    }
  ]
}
```

### Variables:

```bash
- name (Required)
- policy_blocks (Required)
- condition_block (Optional)
- not_before (Optional)
- expires_on (Optional)
```

### Output:

```bash
- id
- issued_on
- modified_on
- status
- value
```

###### More information can be found on the official document [cloudflare_api_token](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/api_token)