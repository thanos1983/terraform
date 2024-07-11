# Schema for the knativeeventings API

## Sample of use:

```bash
module "kubernetes_knative_eventing_<project>" {
  source   = "git::https://example.com/kubernetes_knative_eventing_<my_repo>.git"
  metadata_block = {
    name      = "some-name"
    namespace = "some-namespace"
  }
  .
  .
  .
}
```

### Variables:

```bash
- metadata_block (Required)
- spec_block (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [k8s_operator_knative_dev_knative_eventing_v1beta1_manifest (Data Source)](https://registry.terraform.io/providers/metio/k8s/latest/docs/data-sources/operator_knative_dev_knative_eventing_v1beta1_manifest)