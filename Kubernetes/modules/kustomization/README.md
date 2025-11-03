# Resource to provision JSON encoded Kubernetes resource manifests as produced by the kustomization data source on a Kubernetes cluster.

## Sample of use:

```bash
module "kustomization_<project>" {
  source   = "git::https://example.com/kustomization_<my_repo>.git"
  manifest = "<JSON data>"
}
```

### Variables:

```bash
- manifest (Required)
```

### Output:

```bash
- manifest
```

###### More information can be found on the official document [kustomization_resource](https://registry.terraform.io/providers/kbst/kustomize/latest/docs/resources/kustomization_resource)
