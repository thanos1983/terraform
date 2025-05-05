# Amazon Elastic Kubernetes Service

## Sample of use:

```bash
module "kubernetes_cluster_<project>" {
  source  = "git::https://example.com/kubernetes_cluster_<my_repo>.git"
  name = "my_kubernetes_cluster"
  .
  .
  .
}
```

### Variables:

```bash
- name (Required)
- role_arn (Required)
- vpc_config_block (Required)
- access_config_block (Optional)
- bootstrap_self_managed_addons (Optional)
- compute_config_block (Optional)
- enabled_cluster_log_types (Optional)
- encryption_config_block  (Optional)
- force_update_version (Optional)
- kubernetes_network_config_block (Optional)
- outpost_config_block (Optional)
- remote_network_config_block (Optional)
- storage_config_block (Optional)
- tags (Optional)
- upgrade_policy_block (Optional)
- kubernetes_version (Optional)
- zonal_shift_config_block (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- arn
- certificate_authority
- cluster_id
- created_at
- endpoint
- id
- identity
- platform_version
- status
- tags_all
```

###### More information can be found on the official document [aws_eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster)