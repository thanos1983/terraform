# Hetzner Cloud Network

## Sample of use:

```bash
module "hcloud_network_<project>" {
  source = "git::https://example.com/hcloud_network_<my_repo>.git"
  name   = "my-net"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- ip_range (Required)
- labels (Optional)
- delete_protection (Optional)
- expose_routes_to_vswitch (Optional)
```

### Output:

```bash
- id
- name
- ip_range
- labels
- delete_protection
- expose_routes_to_vswitch
```

###### More information can be found on the official document [hcloud_network](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network)
