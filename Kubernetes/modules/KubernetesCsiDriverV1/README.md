# The Container Storage Interface (CSI).

## Sample of use:

```bash
module "test_kubernetes_csi_driver_v1" {
  source = "git@github.com:.../modules/KubernetesCsiDriverV1"
  metadata_block = {
    name = "terraform-example"
  }

  spec_block = {
    attach_required        = true
    pod_info_on_mount      = true
    volume_lifecycle_modes = ["Ephemeral"]
  }
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
- metadata
```

###### More information can be found on the official document [csi_driver_v1](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/csi_driver_v1)
