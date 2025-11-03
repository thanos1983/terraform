# A service account provides an identity for processes that run in a Pod

## Sample of use:

```bash
module "kubernetes_service_account_v1_<project>" {
  source   = "git::https://example.com/kubernetes_service_account_v1_<my_repo>.git"
  medata_block = {
    name = "example_kubernetes_service_account"
  }
}
```

### Variables:

```bash
- medata_block (Required)
- image_pull_secret_blocks (Optional)
- secret_blocks (Optional)
- automount_service_account_token (Optional)
```

### Output:

```bash
- metadata
- image_pull_secret
- secret
- automount_service_account_token
```

###### More information can be found on the official document [service_account_v1](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account_v1)
