# Provides an Ansible Inventory Host

## Sample of use:

```bash
module "ansible_host_<project>" {
  source = "git::https://example.com/ansible_host_<my_repo>.git"
  name   = "my_host"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- groups (Optional)
- variables (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [ansible_host](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/host)
