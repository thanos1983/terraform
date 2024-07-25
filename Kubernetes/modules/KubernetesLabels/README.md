# This resource allows Terraform to manage the labels for a resource that already exists.

## Sample of use:

```bash
module "kubernetes_labels_<project>" {
  source   = "git::https://example.com/kubernetes_labels_<my_repo>.git"
  api_version = ""
  kind = ""
  labels = ""
  metadata_block = {
    name      = "grafana-ingress"
    namespace = "grafana"
  }
}
```

### Variables:

```bash
- api_version (Required)
- kind (Required)
- labels (Required)
- metadata (Required)
- field_manager (Optional)
- force (Optional)
```

### Output:

```bash
- id
- kind
- labels
- metadata
```

###### More information can be found on the official document [kubernetes_labels](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/labels)