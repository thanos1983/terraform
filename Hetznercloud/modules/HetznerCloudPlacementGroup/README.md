# Hetzner Cloud Placement Group

## Sample of use:

```bash
module "hcloud_placement_group_<project>" {
  source = "git::https://example.com/hcloud_placement_group_<my_repo>.git"
  type   = "spread"
  .
  .
  .
}
```

### Variables:

```bash
- name (Optional)
- type (Required)
- labels (Optional)
```

### Output:

```bash
- id
- name
- type
- labels
```

###### More information can be found on the official document [hcloud_placement_group](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/placement_group)
