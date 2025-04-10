# Hetzner Cloud Network Subnet

## Sample of use:

```bash
module "hcloud_network_subnet_<project>" {
  source       = "git::https://example.com/hcloud_network_subnet_<my_repo>.git"
  network_id   = hcloud_network.mynet.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}
```

### Variables:

```bash
- network_id (Required)
- type (Required)
- ip_range (Required)
- network_zone (Required)
- vswitch_id (Optional)
```

### Output:

```bash
- id
- network_id
- type
- ip_range
- network_zone
- vswitch_id
```

###### More information can be found on the official document [hcloud_network_subnet](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_subnet)
