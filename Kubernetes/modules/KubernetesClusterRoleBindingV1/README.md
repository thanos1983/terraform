# A ClusterRoleBinding may be used to grant permission at the cluster level and in all namespaces

## Sample of use:

```bash
module "kubernetes_cluster_role_binding_<project>" {
  source   = "git::https://example.com/kubernetes_cluster_role_binding_<my_repo>.git"
  metadata_block = {
    name = "cluster_role_binding_example"
  }
  role_ref_block = {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "example-name"
  }
  subject_blocks = [
    {
      name      = "example-name"
      namespace = "default"
      kind      = "ServiceAccount"
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
terraform import module.test_cluster_role_binding.kubernetes_cluster_role_binding_v1.cluster_role_binding_v1 default/example_cluster_role_binding
````

###### More information can be found on the official document [kubernetes_cluster_role_binding_v1](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding_v1)
