# Manages a single group membership within Azure Active Directory

## Sample of use:

```bash
module "azuread_group_member_<project>" {
  source           = "git::https://example.com/azuread_group_member_<my_repo>.git"
  group_object_id  = ""
  member_object_id = ""
}
```

### Variables:

```bash
- group_object_id (Required)
- member_object_id (Required)
- timeouts_block (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [azuread_group_member](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group_member)
