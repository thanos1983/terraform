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

### Example Usage

````bash
module "example_projekt_azure_managed_disk" {
  source               = "git::https://example.com/managed_disk_<my_repo>.git"
  name                 = "acctestmd"
  location             = azurerm_resource_group.example.location
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "PremiumV2_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
}

module "example_projekt_k8s_pv" {
  source   = "git::https://example.com/kubernetes_persistent_volume_<my_repo>.git"
  metadata_block = {
    name = "example"
  }
  spec_block = {
    capacity = {
      storage = "1Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source_block = {
      azure_disk_block = {
        caching_mode  = "None"
        data_disk_uri = module.example_projekt_azure_managed_disk.id
        disk_name     = module.example_projekt_azure_managed_disk.name
        kind          = "Managed"
      }
    }
  }
}
````

### Output:

```bash
- id
```

###### More information can be found on the official document [persistent_volume_v1](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_v1)