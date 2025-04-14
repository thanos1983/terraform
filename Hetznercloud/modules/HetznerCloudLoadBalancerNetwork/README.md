# Hetzner Cloud Load Balancer Network

## Sample of use:

```bash
module "hcloud_load_balancer_<project>" {
  source           = "git::https://example.com/hcloud_load_balancer_<my_repo>.git"
  load_balancer_id = hcloud_load_balancer.lb1.id
  .
  .
  .
}
```

### Variables:

```bash
- load_balancer_id (Required)
- network_id (Optional)
- subnet_id (Optional)
- ip (Optional)
- enable_public_interface (Optional)
```

### Output:

```bash
- id
- network_id
- load_balancer_id
- ip
```

###### More information can be found on the official document [hcloud_load_balancer_network](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/load_balancer_network)
