# Hetzner Cloud Load Balancer

## Sample of use:

```bash
module "hcloud_load_balancer_<project>" {
  source             = "git::https://example.com/hcloud_load_balancer_<my_repo>.git"
  name               = "my-load-balancer"
  load_balancer_type = "lb11"
}
```

### Variables:

```bash
- name (Required)
- load_balancer_type (Required)
- location (Optional)
- network_zone (Optional)
- algorithm_block (Optional)
- labels (Optional)
- delete_protection (Optional)
```

### Output:

```bash
- id
- load_balancer_type
- name
- location
- ipv4
- ipv6
- algorithm
- labels
- delete_protection
- network_id
- network_ip
```

###### More information can be found on the official document [hcloud_load_balancer](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/load_balancer)
