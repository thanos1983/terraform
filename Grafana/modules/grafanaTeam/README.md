# Grafana Teams makes it easy to organize and administer groups of users in your enterprise

## Sample of use:

```bash
module "grafana_team_<project>" {
  source = "git::https://example.com/grafana_team_<my_repo>.git"
  name   = "Test Team"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- email (Optional)
- ignore_externally_synced_members (Optional)
- members (Optional)
- org_id (Optional)
- preferences (Optional)
- team_sync (Optional)
```

### Output:

```bash
- id
- team_id
- name
```

###### More information can be found on the official document [grafana_team](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/team)