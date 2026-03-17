# Azure Windows Virtual Machine

## Sample of use:

```bash
module "windows_virtual_machine_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_windows_virtual_machine"
  .
  .
  .
}
```

### Variables:

```bash
- admin_password - (Required)
- admin_username - (Required)
- location - (Required)
- name - (Required)
- network_interface_ids - (Required)
- os_disk_block - (Required)
- resources_group_name - (Required)
- size - (Required)
- additional_capabilities_block - (Optional)
- additional_unattend_content_blocks - (Optional)
- allow_extension_operations - (Optional)
- availability_set_id - (Optional)
- boot_diagnostics_block - (Optional)
- capacity_reservation_group_id - (Optional)
- computer_name - (Optional)
- custom_data - (Optional)
- dedicated_host_id - (Optional)
- dedicated_host_group_id - (Optional)
- edge_zone - (Optional)
- encryption_at_host_enabled - (Optional)
- eviction_policy - (Optional)
- extensions_time_budget - (Optional)
- gallery_application_blocks - (Optional)
- hotpatching_enabled - (Optional)
- identity_block - (Optional)
- license_type - (Optional)
- max_bid_price - (Optional)
- patch_assessment_mode - (Optional)
- patch_mode - (Optional)
- plan_block - (Optional)
- platform_fault_domain - (Optional)
- priority - (Optional)
- provision_vm_agent - (Optional)
- proximity_placement_group_id - (Optional)
- secret_block - (Optional)
- secure_boot_enabled - (Optional)
- source_image_id - (Optional)
- source_image_reference_block - (Required)
- tags - (Optional)
- termination_notification_block - (Optional)
- timezone - (Optional)
- user_data - (Optional)
- virtual_machine_scale_set_id - (Optional)
- vtpm_enabled - (Optional)
- winrm_listener_blocks - (Optional)
- zone - (Optional)
- timeouts_block - (Optional)
```

### Output:

```bash
- administrator_username
- administrator_password
- id
- name
- identity
- principal_id
- tenant_id
- private_ip_address
- private_ip_addresses
- public_ip_address
- public_ip_addresses
- virtual_machine_id
```

###### More information can be found on the official document [azurerm_windows_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine)
