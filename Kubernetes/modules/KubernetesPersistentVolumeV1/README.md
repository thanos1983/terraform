# Create a kubernetes persistent volume v1

## Sample of use:

```bash
module "kubernetes_persistent_volume_<project>" {
  source   = "git::https://example.com/kubernetes_persistent_volume_<my_repo>.git"
  metadata_block = {}
  .
  .
  .
}
```

### Variables:

```bash
- metadata_block (Required)
- spec_block (Required)
```

### Output:

```bash
- id
```

###### More information can be found on the official document [persistent_volume_v1](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_v1)