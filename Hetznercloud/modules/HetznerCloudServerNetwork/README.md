# Hetzner Cloud Server Network

## Sample of use:

```bash
module "hcloud_server_network_<project>" {
  source     = "git::https://example.com/hcloud_server_network_<my_repo>.git"
  server_id  = hcloud_server.node1.id
  network_id = hcloud_network.mynet.id
  ip         = "10.0.1.5"
  .
  .
}
```

### Variables:

```bash
- server_id (Required)
- alias_ips (Optional)
- network_id (Optional)
- subnet_id (Optional)
- ip (Optional)
```

### Output:

```bash
- id
- network_id
- server_id
- ip
- alias_ips
```

###### More information can be found on the official document [hcloud_server_network](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server_network)
