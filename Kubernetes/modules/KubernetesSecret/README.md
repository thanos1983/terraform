# Create a Kubernetes secret

## Sample of use:

```bash
module "kubernetes_secret_<project>" {
  source   = "git::https://example.com/kubernetes_secret_<my_repo>.git"
  metadata_block = {}
  .
  .
  .
}
```

### Variables:

```bash
- data (Optional)
- binary_data (Optional)
- metadata_block (Required)
- type (Optional)
- immutable (Optional)
- wait_for_service_account_token (Optional)
```

### Output:

```bash
- generation
- resource_version
- uid
```

###### More information can be found on the official document [kubernetes_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret)