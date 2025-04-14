# Hetzner Cloud Load Balancer Service

## Sample of use:

```bash
module "hcloud_load_balancer_service_<project>" {
  source           = "git::https://example.com/hcloud_load_balancer_service_<my_repo>.git"
  load_balancer_id = hcloud_load_balancer.lb1.id
  protocol         = "http"
  .
  .
  .
}
```

### Variables:

```bash
- load_balancer_id (Required)
- protocol (Optional)
- listen_port (Optional)
- destination_port (Optional)
- proxyprotocol (Optional)
- http_block (Optional)
- health_check_block (Optional)
```

### Output:

```bash
- protocol
- listen_port
- destination_port
- proxyprotocol
- health_check
```

###### More information can be found on the official document [hcloud_load_balancer_service](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/load_balancer_service)
