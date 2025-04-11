# Hetzner Cloud Floating IP Assignment

## Sample of use:

```bash
module "hcloud_floating_ip_assignment_<project>" {
  source         = "git::https://example.com/hcloud_floating_ip_assignment_<my_repo>.git"
  floating_ip_id = hcloud_floating_ip.master.id
  server_id      = hcloud_server.node1.id
}
```

### Variables:

```bash
- floating_ip_id (Required)
- server_id (Required)
```

### Output:

```bash
- id
- floating_ip_id
- server_id
```

###### More information can be found on the official document [hcloud_floating_ip_assignment](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/floating_ip_assignment)
