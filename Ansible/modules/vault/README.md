# Provides an Ansible vault resource

## Sample of use:

```bash
module "ansible_vault<project>" {
  source   = "git::https://example.com/ansible_vault_<my_repo>.git"
  name = "my_vault"
  .
  .
  .
}
```

### Variables:

```bash
- vault_file (Required)
- vault_password_file (Required)
- vault_id (Optional)
```

### Output:

```bash
- id
- args
- yaml
```

###### More information can be found on the official document [vault](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/vault)