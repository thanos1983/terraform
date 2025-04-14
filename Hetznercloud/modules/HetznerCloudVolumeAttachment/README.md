# Hetzner Cloud Volume Attachment

## Sample of use:

```bash
module "hcloud_volume_attachment_<project>" {
  source    = "git::https://example.com/hcloud_volume_attachment_<my_repo>.git"
  volume_id = hcloud_volume.master.id
  server_id = hcloud_server.node1.id
  .
  .
  .
}
```

### Variables:

```bash
- volume_id (Required)
- server_id (Required)
- automount (Optional)
```

### Output:

```bash
- id
- volume_id
- server_id
```

###### More information can be found on the official document [hcloud_volume_attachment](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume_attachment)
