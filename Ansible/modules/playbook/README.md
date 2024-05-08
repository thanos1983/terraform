# Provides an Ansible playbook resource

## Sample of use:

```bash
module "ansible_playbook<project>" {
  source   = "git::https://example.com/ansible_playbook_<my_repo>.git"
  name = "my_playbook"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- playbook (Required)
- ansible_playbook_binary (Optional)
- check_mode (Optional)
- diff_mode (Optional)
- extra_vars (Optional)
- force_handlers (Optional)
- groups (Optional)
- ignore_playbook_failure (Optional)
- limit (Optional)
- replayable (Optional)
- tags (Optional)
- timeouts_block (Optional)
- var_files (Optional)
- vault_files (Optional)
- vault_id (Optional)
- vault_password_file (Optional)
- verbosity (Optional)
```

### Output:

```bash
- id
- ansible_playbook_stderr
- ansible_playbook_stdout
- args
- temp_inventory_file
```

###### More information can be found on the official document [playbook](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook)