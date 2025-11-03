# Manages a Shared Image within a Shared Image Gallery

## Sample of use:

```bash
module "service_principal_<project>" {
  source  = "git::https://example.com/shared_image_<my_repo>.git"
  name = "my_shared_image"
  .
  .
  .
}
```

### Variables:

```bash
- name - (Required)
- gallery_name - (Required)
- resource_group_name - (Required)
- location - (Required)
- identifier - (Required)
- os_type - (Required)
- purchase_plan - (Optional)
- account_enabled - (Optional)
- description - (Optional)
- disk_types_not_allowed - (Optional)
- end_of_life_date - (Optional)
- eula - (Optional)
- specialized - (Optional)
- architecture - (Optional)
- hyper_v_generation - (Optional)
- max_recommended_vcpu_count - (Optional)
- min_recommended_vcpu_count - (Optional)
- max_recommended_memory_in_gb - (Optional)
- min_recommended_memory_in_gb - (Optional)
- privacy_statement_uri - (Optional)
- release_note_uri - (Optional)
- trusted_launch_supported - (Optional)
- trusted_launch_enabled - (Optional)
- confidential_vm_supported - (Optional)
- confidential_vm_enabled - (Optional)
- accelerated_network_support_enabled - (Optional)
- hibernation_enabled - (Optional)
- tags - (Optional) 
```

### Output:

```bash
- id
- name
```

###### More information can be found on the official document [azuread_service_principal](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal)
