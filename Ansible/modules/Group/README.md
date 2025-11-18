# Provides an Ansible Inventory Group

## Sample of use:

```bash
module "ansible_group<project>" {
  source = "git::https://example.com/ansible_group_<my_repo>.git"
  name   = "my_group"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- children (Optional)
- variables (Optional)
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [ansible_group](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/group)
