# Hetzner Cloud Volume

## Sample of use:

```bash
module "hcloud_volume_<project>" {
  source = "git::https://example.com/hcloud_volume_<my_repo>.git"
  name   = "volume1"
  size   = 50
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- size (Required)
- labels (Optional)
- server_id (Optional)
- location (Optional)
- automount (Optional)
- format (Optional)
- delete_protection (Optional)
```

### Output:

```bash
- id
- name
- size
- location
- server_id
- labels
- linux_device
- delete_protection
```

###### More information can be found on the official document [hcloud_volume](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume)
