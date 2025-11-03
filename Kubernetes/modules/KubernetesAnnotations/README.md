# This resource allows Terraform to manage the annotations for a resource that already exists.

## Sample of use:

```bash
module "kubernetes_labels_<project>" {
  source   = "git::https://example.com/kubernetes_labels_<my_repo>.git"
  api_version    = "v1"
  kind           = "namespace"
  annotations    = {
    "owner" = "myteam"
  }
  metadata_block = {
    name      = "demo"
    namespace = "demo"
  }
}
```

### Variables:

```bash
- api_version (Required)
- kind (Required)
- metadata (Required)
- annotations (Optional)
- field_manager (Optional)
- force (Optional)
- template_annotations (Optional)
```

### Output:

```bash
- api_version
- id
- kind  
- metadata
```

###### More information can be found on the official document [kubernetes_annotations](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/annotations)
