# Hetzner Cloud Server

## Sample of use:

```bash
module "hcloud_server_<project>" {
  source = "git::https://example.com/hcloud_server_<my_repo>.git"
  name   = "my-server"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- server_type (Required)
- image (Required)
- location (Optional)
- datacenter (Optional)
- user_data (Optional)
- ssh_keys (Optional)
- public_net_block (Optional)
- keep_disk (Optional)
- iso (Optional)
- rescue (Optional)
- labels (Optional)
- backups (Optional)
- firewall_ids (Optional)
- ignore_remote_firewall_ids (Optional)
- network_blocks (Optional)
- placement_group_id (Optional)
- delete_protection (Optional)
- rebuild_protection (Optional)
- allow_deprecated_images (Optional)
- shutdown_before_deletion (Optional)
```

### Output:

```bash
- id
- name
- server_type
- image
- location
- datacenter
- user_data
- ssh_keys
- public_net_block
- keep_disk
- iso
- rescue
- labels
- backups
- firewall_ids
- ignore_remote_firewall_ids
- network_blocks
- placement_group_id
- delete_protection
- rebuild_protection
- allow_deprecated_images
- shutdown_before_deletion
```

###### More information can be found on the official document [hcloud_server](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server)
