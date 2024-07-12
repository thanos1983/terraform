# Create a Kubernetes namespace

## Sample of use:

```bash
module "kubernetes_namespace_<project>" {
  source   = "git::https://example.com/kubernetes_namespace_<my_repo>.git"
  metadata_block = {
    annotations = {
      name = "example-annotation"
    }

    labels = {
      mylabel = "label-value"
    }

    name = "terraform-example-namespace"
  }
  .
  .
  .
}
```

### Variables:

```bash
- metadata_block (Required)
- wait_for_default_service_account (Optional)
```

### Output:

```bash
- generation
- resource_version
- uid
```

###### More information can be found on the official document [kubernetes_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace_v1)