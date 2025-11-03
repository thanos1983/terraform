# Represents one Kubernetes resource by supplying a manifest attribute

## Sample of use:

```bash
module "kubernetes_manifest_<project>" {
  source         = "git::https://example.com/kubernetes_manifest_<my_repo>.git"
  manifest_block = {
    "apiVersion" = "openfaas.com/v1"
    "kind" = "Function"
    "metadata" = {
      "name" = "showcow"
      "namespace" = "openfaas-fn"
    }
    "spec" = {
      "handler" = "node show_cow.js"
      "image" = "alexellis2/ascii-cows-openfaas:0.1"
      "name" = "showcow"
    }
  }
  .
  .
  .
}
```

### Variables:

```bash
- manifest (Required)
- computed_fields (Optional)
- object (Optional)
- wait_block (Optional)
- field_manager_block (Optional)
- timeouts_block (Optional)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [kubernetes_manifest](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest)
