# Azure Linux Virtual Machine Scale Set

## Sample of use:

```bash
module "linux_virtual_machine_scale_set_<project>" {
  source   = "git::https://example.com/azure_<my_repo>.git"
  name = "my_linux_virtual_machine_scale_set"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- location - (Required)
- resources_group_name - (Required)
- admin_username - (Required)
- instances (Optional)
- sku (Required)
- network_interface_blocks (Required)
- os_disk_block (Required)
- additional_capabilities_block (Optional)
- admin_password - (Optional)
- admin_ssh_key_blocks (Optional)
- automatic_os_upgrade_policy_block (Optional)
- automatic_instance_repair_block (Optional)
- boot_diagnostics_block (Optional)
- capacity_reservation_group_id (Optional)
- computer_name_prefix (Optional)
- custom_data (Optional)
- data_disk_blocks (Optional)
- disable_password_authentication (Optional)
- do_not_run_extensions_on_overprovisioned_machines (Optional)
- edge_zone (Optional)
- encryption_at_host_enabled (Optional)
- extension_blocks (Optional)
- extension_operations_enabled (Optional)
- extensions_time_budget (Optional)
- eviction_policy (Optional)
- gallery_application_blocks (Optional)
- health_probe_id (Optional)
- host_group_id (Optional)
- identity_block (Optional)
- max_bid_price (Optional)
- overprovision (Optional)
- plan_block (Optional)
- platform_fault_domain_count (Optional)
- priority (Optional)
- provision_vm_agent (Optional)
- proximity_placement_group_id (Optional)
- rolling_upgrade_policy_block (Optional)
- scale_in_block (Optional)
- secret_blocks (Optional)
- secure_boot_enabled (Optional)
- single_placement_group (Optional)
- source_image_id (Optional)
- source_image_reference_block (Optional)
- spot_restore_block (Optional)
- tags (Optional)
- termination_notification_block (Optional)
- upgrade_mode (Optional)
- user_data (Optional)
- vtpm_enabled (Optional)
- zone_balance (Optional)
- zones (Optional)
```

### Output:

```bash
- id
- name
- identity
- unique_id
- admin_username
- admin_password
```

###### More information can be found on the official document [azurerm_linux_virtual_machine_scale_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set)