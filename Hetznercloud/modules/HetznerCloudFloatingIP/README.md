# Hetzner Cloud Floating IP

## Sample of use:

```bash
module "hcloud_floating_ip_<project>" {
  source = "git::https://example.com/hcloud_floating_ip_<my_repo>.git"
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
- name (Optional)
- server_id (Optional)
- home_location (Optional)
- description (Optional)
- labels (Optional)
- delete_protection (Optional)
```

### Output:

```bash
- id
- type
- name
- server_id
- home_location
- description
- ip_address
- ip_network
- labels
- delete_protection
```

###### More information can be found on the official document [hcloud_floating_ip](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/floating_ip)
