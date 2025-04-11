# Hetzner Cloud SSH Key

## Sample of use:

```bash
module "hcloud_ssh_key_<project>" {
  source     = "git::https://example.com/hcloud_ssh_key_<my_repo>.git"
  name       = "my-ssh-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}
```

### Variables:

```bash
- name (Required)
- public_key (Required)
- labels (Optional)
```

### Output:

```bash
- id
- fingerprint
```

###### More information can be found on the official document [hcloud_ssh_key](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/ssh_key)
