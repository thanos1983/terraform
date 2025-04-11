# Hetzner Cloud Primary IP

## Sample of use:

```bash
module "hcloud_primary_ip_<project>" {
  source = "git::https://example.com/hcloud_primary_ip_<my_repo>.git"
  type   = "ipv4"
  name   = "my-ip"
  .
  .
  .
}
```

### Variables:

```bash
- type (Required)
- name (Required)
- datacenter (Optional)
- auto_delete (Optional)
- labels (Optional)
- assignee_id (Optional)
- assignee_type (Optional)
- delete_protection (Optional)
```

### Output:

```bash
- id
- type
- datacenter
- name
- auto_delete
- labels
- assignee_id
- assignee_type
- delete_protection
```

###### More information can be found on the official document [hcloud_primary_ip](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip)
