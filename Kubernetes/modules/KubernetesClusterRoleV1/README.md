# A ClusterRole creates a role at the cluster level and in all namespaces.

## Sample of use:

```bash
module "test_cluster_role" {
  source = "git@github.com:.../modules/KubernetesClusterRoleV1"
  metadata_block = {
    name = "terraform-example"
  }

  aggregation_rule_block = {
    cluster_role_selectors_blocks = [
      {
        match_labels = {
          foo = "bar"
        }

        match_expressions_blocks = [
          {
            key      = "environment"
            operator = "In"
            values   = ["non-exists-12345"]
          },
          {
            key      = "environment"
            operator = "In"
            values   = ["non-exists-54321"]
          }
        ]
      }
    ]
  }
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
- metadata
- rule
- aggregation_rule
```

#### How to import the module

Sample of code:

````bash
terraform import module.test_cluster_role.kubernetes_cluster_role_v1.cluster_role_v1 default/example-cluster_role
````

###### More information can be found on the official document [kubernetes_cluster_role_v1](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_v1)
