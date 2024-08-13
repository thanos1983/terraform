# This resource represents an instance-scoped resource and uses Grafana's admin APIs

## Sample of use:

```bash
module "grafana_user_<project>" {
  source        = "git::https://example.com/grafana_user_<my_repo>.git"
  provider_name = "azuread"
  .
  .
  .
}
```

### Variables:

```bash
- email (Required)
- password (Required)
- is_admin (Optional)
- login (Optional)
- name (Optional)
```

### Output:

```bash
- id
- user_id
- name
```

###### More information can be found on the official document [grafana_user](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/user)