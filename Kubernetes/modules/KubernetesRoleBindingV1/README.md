# A RoleBinding may be used to grant permission at the namespace level.

## Sample of use:

```bash
module "kubernetes_role_binding_<project>" {
  source   = "git::https://example.com/kubernetes_role_binding_<my_repo>.git"
  metadata_block = {
    name      = "example-role-binding"
    namespace = "example"
  }
  role_ref_block = {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "admin"
  }
  subject_blocks = [
    {
      kind      = "User"
      name      = "admin"
      api_group = "rbac.authorization.k8s.io"
    },
    {
      kind      = "ServiceAccount"
      name      = "default"
      namespace = "kube-system"
    },
    {
      kind      = "Group"
      name      = "system:masters"
      api_group = "rbac.authorization.k8s.io"
    }
  ]
}
```

### Variables:

```bash
- metadata_block (Required)
- role_ref_block (Required)
- subject_blocks (Required)
```

### Output:

```bash
- metadata
- role_ref
- subject
```

#### How to import the module

Sample of code:

````bash
terraform import module.test_kubernetes_role_binding.kubernetes_role_binding_v1.role_binding_v1 default/example_role_binding
````

###### More information can be found on the official document [kubernetes_role_binding_v1](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding_v1)