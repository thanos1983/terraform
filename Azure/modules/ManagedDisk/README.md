# Manages a Managed Disk

## Sample of use:

```bash
module "managed_disk_<project>" {
  source   = "git::https://example.com/managed_disk_<my_repo>.git"
  name = "my_managed_disk"
  .
  .
  .
}
```

### Variables:

```bash
resource "azurerm_managed_disk" "managed_disk" {
 - name (Required)
 - resource_group_name (Required)
 - location (Required)
 - storage_account_type (Required)
 - create_option (Required)
 - disk_encryption_set_id (Optional)
 - disk_iops_read_write (Optional)
 - disk_mbps_read_write (Optional)
 - disk_iops_read_only (Optional)
 - disk_mbps_read_only (Optional)
 - upload_size_bytes (Optional)
 - disk_size_gb (Optional)
 - edge_zone (Optional)
 - encryption_settings_block (Optional)
 - hyper_v_generation (Optional)
 - image_reference_id (Optional)
 - gallery_image_reference_id (Optional)
 - logical_sector_size (Optional)
 - optimized_frequent_attach_enabled (Optional)
 - performance_plus_enabled (Optional)
 - os_type (Optional)
 - source_resource_id (Optional)
 - source_uri (Optional)
 - storage_account_id (Optional)
 - tier (Optional)
 - max_shares (Optional)
 - trusted_launch_enabled (Optional)
 - security_type (Optional)
 - secure_vm_disk_encryption_set_id (Optional)
 - on_demand_bursting_enabled (Optional)
 - tags (Optional)
 - zone (Optional)
 - network_access_policy (Optional)
 - disk_access_id (Optional)
 - public_network_access_enabled (Optional)
 - timeouts_block (Optional)
}
```

### Example usage

````bash
module "example_projekt_managed_disk" {
  source               = "git::https://example.com/managed_disk_<my_repo>.git"
  name                 = "acctestmd"
  location             = azurerm_resource_group.example.location
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "PremiumV2_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"
}
````

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [managed_disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk)
