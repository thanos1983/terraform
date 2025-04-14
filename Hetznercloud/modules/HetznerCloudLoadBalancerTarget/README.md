# Hetzner Cloud Load Balancer Target 

## Sample of use:

```bash
module "hcloud_load_balancer_target_<project>" {
  source           = "git::https://example.com/hcloud_load_balancer_target_<my_repo>.git"
  load_balancer_id = hcloud_load_balancer.lb1.id
  protocol         = "http"
  .
  .
  .
}
```

### Variables:

```bash
- type (Required)
- load_balancer_id (Required)
- server_id (Optional)
- label_selector (Optional)
- ip (Optional)
- use_private_ip (Optional)
```

### Output:

```bash
- type
- server_id
- label_selector
- ip
- use_private_ip
```

###### More information can be found on the official document [hcloud_load_balancer_target](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/load_balancer_target)
