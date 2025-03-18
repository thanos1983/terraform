# Provides a resource which manages Cloudflare API tokens

## Sample of use:

```bash
module "cloudflare_api_token_<project>" {
  source        = "git::https://example.com/cloudflare_api_token_<my_repo>.git"
  name          = "readonly token"
  policies = [
    {
      effect = "allow" 
      permission_groups_blocks = [
        id = "c8fed203ed3043cba015a93ad1616f1f"
      ]
      resources = {
        "com.cloudflare.api.account.zone.*" = "*"
      }
    }
  ]s
}
```

### Variables:

```bash
- name (Required)
- policies (Required)
- condition (Optional)
- expires_on (Optional)
- not_before (Optional)
- status (Optional)
```

### Output:

```bash
- id
- issued_on
- last_used_on
- modified_on
- value
```

#### API token permissions [Products > Cloudflare Fundamentals > Cloudflare's API > Reference > API token permissions](https://developers.cloudflare.com/fundamentals/api/reference/permissions/)

###### More information can be found on the official document [cloudflare_api_token](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/api_token)