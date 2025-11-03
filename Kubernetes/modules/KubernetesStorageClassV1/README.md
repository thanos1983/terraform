# Storage class is the foundation of dynamic provisioning.

## Sample of use:

```bash
module "test_kubernetes_storage_class_v1" {
  source = "git@github.com:.../modules/KubernetesStorageClassV1"
  metadata_block = {
    name = "my-azurefile"
  }

  storage_provisioner    = "file.csi.azure.com"
  reclaim_policy         = "Delete"
  volume_binding_mode    = "Immediate"
  allow_volume_expansion = true
  parameters = {
    skuName = "Standard_LRS"
  }
  mount_options = ["dir_mode=0640", "file_mode=0640", "uid=0", "gid=0", "mfsymlinks", "cache=strict", "actimeo=30"]
}
```

### Variables:

```bash
- metadata_block (Required)
- storage_provisioner (Required)
- allow_volume_expansion (Optional)
- allowed_topologies_block (Optional)
- mount_options (Optional)
- parameters (Optional)
- reclaim_policy (Optional)
- volume_binding_mode (Optional)
```

### Output:

```bash
- id
- metadata
```

###### More information can be found on the official document [storage_class_v1](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/storage_class_v1)
