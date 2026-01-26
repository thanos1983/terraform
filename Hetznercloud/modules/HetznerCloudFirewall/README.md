# Hetzner Firewall 

## Sample of use:

```bash
module "hcloud_firewall_<project>" {
  source = "git::https://example.com/hcloud_firewall_<my_repo>.git"
  name   = "my_firewall_rule"
  labels = {
    "key" = "value"
  }
  rule {
    direction = "in"
    protocol  = "icmp"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
  .
  .
  .
}
```

### Variables:

```bash
- name (Optional)
- labels (Optional)
- rule (Optional)
- apply_to (Optional)
```

### Output:

```bash
- id
- name
- rule
- labels
- apply_to
```

###### More information can be found on the official document [hcloud_firewall](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall)
