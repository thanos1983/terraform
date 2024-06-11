# A role contains rules that represent a set of permissions.

## Sample of use:

```bash
module "kubernetes_role_<project>" {
  source   = "git::https://example.com/kubernetes_role_v1_<my_repo>.git"
  metadata_block = {
    .
    .
    .
  }
  .
  .
  .
}
```

### Variables:

```bash
- metadata_block (Required)
- rule_blocks (Optional)
- aggregation_rule_block (Optional)
```

### Output:

```bash
- generation
- resource_version
- uid
```

#### How to import the module

Sample of code:

````bash
terraform import module.test_role.kubernetes_role_v1.role_v1 default/example-cluster_role
````

###### More information can be found on the official document [kubernetes_role_v1](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_v1)