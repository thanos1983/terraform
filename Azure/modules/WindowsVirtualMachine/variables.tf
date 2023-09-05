variable "admin_password" {
  description = "The Password which should be used for the local-administrator on this Virtual Machine."
  type        = string
  default     = null
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine."
  type        = string
  default     = "adminuser"
}

variable "length" {
  description = "The length of the string desired. The minimum value for length is 1."
  type        = number
  default     = 25
}

variable "lower" {
  description = "Include lowercase alphabet characters in the result."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.lower)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "min_lower" {
  description = "Minimum number of lowercase alphabet characters in the result."
  type        = number
  default     = 2
}

variable "min_numeric" {
  description = "Minimum number of numeric characters in the result."
  type        = number
  default     = 2
}

variable "min_special" {
  description = "Minimum number of special characters in the result."
  type        = number
  default     = 2
}

variable "min_upper" {
  description = "Minimum number of uppercase alphabet characters in the result."
  type        = number
  default     = 2
}

variable "numeric" {
  description = "Include numeric characters in the result."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.numeric)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "special" {
  description = "Include special characters in the result."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.special)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "upper" {
  description = "Include uppercase alphabet characters in the result."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.upper)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "location" {
  description = "The Azure location where the Windows Virtual Machine should exist."
  type        = string
}

variable "name" {
  description = "The name of the Windows Virtual Machine."
  type        = string
}

variable "network_interface_ids" {
  description = "A list of Network Interface IDs which should be attached to this Virtual Machine."
  type        = list(string)
}

variable "caching" {
  description = "The Type of Caching which should be used for the Internal OS Disk."
  type        = string
  validation {
    condition = contains([
      "None", "ReadOnly", "ReadWrite"
    ], title(var.caching))
    error_message = "Kind of account must be \"None\", \"ReadOnly\" or \"ReadWrite\"."
  }
  default = "ReadWrite"
}

variable "storage_account_type" {
  description = "The Type of Storage Account which should back this the Internal OS Disk."
  type        = string
  validation {
    condition = contains([
      "Standard_LRS", "StandardSSD_LRS", "Premium_LRS"
    ], title(var.storage_account_type))
    error_message = "Storage account type can only be \"Standard_LRS\", \"StandardSSD_LRS\", \"Premium_LRS\", \"StandardSSD_ZRS\" or \"Premium_ZRS\"."
  }
  default = "Standard_LRS"
}

variable "diff_disk_settings_block" {
  description = "A diff_disk_settings block as defined above. "
  type = object({
    option    = string
    placement = optional(string)
  })
  default = null
}

variable "disk_encryption_set_id" {
  description = "The ID of the Disk Encryption Set which should be used to Encrypt this OS Disk."
  type        = string
  default     = null
}

variable "disk_size_gb" {
  description = "The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from."
  type        = string
  default     = null
}

variable "disk_name" {
  description = "The name which should be used for the Internal OS Disk."
  type        = string
  default     = null
}

variable "secure_vm_disk_encryption_set_id" {
  description = "The ID of the Disk Encryption Set which should be used to Encrypt this OS Disk when the Virtual Machine is a Confidential VM."
  type        = string
  default     = null
}

variable "security_encryption_type" {
  description = "Encryption Type when the Virtual Machine is a Confidential VM."
  type        = string
  default     = null
}

variable "write_accelerator_enabled" {
  description = "Should Write Accelerator be Enabled for this OS Disk?"
  type        = bool
  validation {
    condition = contains([
      "true", "false"
    ], tostring(lower(var.write_accelerator_enabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = false
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the Windows Virtual Machine should be exist."
  type        = string
}

variable "size" {
  description = "The SKU which should be used for this Virtual Machine, such as Standard_F2."
  type        = string
  validation {
    condition = contains([
      "Standard_F1", "Standard_F2", "Standard_F4", "Standard_F8", "Standard_F16",
      "Standard_D1_v2", "Standard_D2_v2", "Standard_D3_v2", "Standard_D4_v2", "Standard_D5_v2",
      "Standard_DS1_v2", "Standard_DS2_v2", "Standard_DS3_v2", "Standard_DS4_v2", "Standard_DS5_v2"
    ], title(var.size))
    error_message = "SKU size values can only be \"Standard_F1\", \"Standard_F2\", \"Standard_F4\", \"Standard_F8\", \"Standard_F16\", \"Standard_D1_v2\", \"Standard_D2_v2\", \"Standard_D3_v2\", \"Standard_D4_v2\", \"Standard_D5_v2\", \"Standard_DS1_v2\", \"Standard_DS2_v2\", \"Standard_DS3_v2\", \"Standard_DS4_v2\" or \"Standard_DS5_v2\"."
  }
  default = "Standard_D2_v2"
}

variable "additional_capabilities_block" {
  description = "A additional_capabilities block."
  type = object({
    ultra_ssd_enabled = optional(bool)
  })
  default = null
}

variable "additional_unattend_content_block" {
  description = "One or more additional_unattend_content blocks as defined below."
  type = list(object({
    content = string
    setting = string
  }))
  default = []
}

variable "allow_extension_operations" {
  description = "Should Extension Operations be allowed on this Virtual Machine?"
  type        = bool
  validation {
    condition = contains([
      "True", "False"
    ], tostring(title(var.allow_extension_operations)))
    error_message = "Possible values can only be \"True\" or \"False\"."
  }
  default = true
}

variable "availability_set_id" {
  description = "Specifies the ID of the Availability Set in which the Virtual Machine should exist."
  type        = string
  default     = null
}

variable "boot_diagnostics_block" {
  description = "A boot_diagnostics block as defined below."
  type = object({
    storage_account_uri = optional(string)
  })
  default = null
}

variable "capacity_reservation_group_id" {
  description = "Specifies the ID of the Capacity Reservation Group which the Virtual Machine should be allocated to."
  type        = string
  default     = null
}

variable "computer_name" {
  description = "Specifies the Hostname which should be used for this Virtual Machine."
  type        = string
}

variable "custom_data" {
  description = "The Base64-Encoded Custom Data which should be used for this Virtual Machine."
  type        = string
  default     = null
}

variable "dedicated_host_id" {
  description = "The ID of a Dedicated Host where this machine should be run on."
  type        = string
  default     = null
}

variable "dedicated_host_group_id" {
  description = "The ID of a Dedicated Host Group that this Windows Virtual Machine should be run within."
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Windows Virtual Machine should exist."
  type        = string
  default     = null
}

variable "enable_automatic_updates" {
  description = "Specifies if Automatic Updates are Enabled for the Windows Virtual Machine."
  type        = bool
  validation {
    condition = contains([
      "true", "false"
    ], lower(tostring(var.enable_automatic_updates)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
}

variable "encryption_at_host_enabled" {
  description = "Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?"
  type        = string
  default     = null
}

variable "eviction_policy" {
  description = "Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance."
  type        = string
  default     = null
}

variable "extensions_time_budget" {
  description = "Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to 90 minutes (PT1H30M)."
  type        = string
  default     = "PT1H30M"
}

variable "gallery_application_block" {
  description = "One or more gallery_application blocks."
  type = list(object({
    version_id             = string
    configuration_blob_uri = optional(string)
    order                  = optional(number)
    tag                    = optional(string)
  }))
  default = []
}

variable "hotpatching_enabled" {
  description = " Should the VM be patched without requiring a reboot? Possible values are true or false."
  type        = bool
  validation {
    condition = contains([
      "true", "false"
    ], lower(tostring(var.hotpatching_enabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = false
}

variable "identity_block" {
  description = "An identity block."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "license_type" {
  description = "Specifies the type of on-premise license (also known as Azure Hybrid Use Benefit) which should be used for this Virtual Machine."
  type        = string
  validation {
    condition = contains([
      "None", "Windows_Client", "Windows_Server"
    ], title(var.license_type))
    error_message = "Possible values can only be \"None\", \"Windows_Client\" or \"Windows_Server\"."
  }
  default = "None"
}

variable "max_bid_price" {
  description = "The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price."
  type        = string
  default     = "-1"
}

variable "patch_assessment_mode" {
  description = "Specifies the mode of VM Guest Patching for the Virtual Machine."
  type        = string
  validation {
    condition = contains([
      "AutomaticByPlatform", "ImageDefault"
    ], title(var.patch_assessment_mode))
    error_message = "Possible values can only be \"AutomaticByPlatform\" or \"ImageDefault\"."
  }
  default = "ImageDefault"
}

variable "patch_mode" {
  description = " Specifies the mode of in-guest patching to this Windows Virtual Machine."
  type        = string
  validation {
    condition = contains([
      "Manual", "AutomaticByOS", "AutomaticByPlatform"
    ], title(var.patch_mode))
    error_message = "Possible values can only be \"Manual\", \"AutomaticByPlatform\" or \"AutomaticByOS\"."
  }
  default = "AutomaticByOS"
}

variable "plan_block" {
  description = "A plan block."
  type = object({
    name      = string
    product   = string
    publisher = string
  })
  default = null
}

variable "platform_fault_domain" {
  description = "Specifies the Platform Fault Domain in which this Windows Virtual Machine should be created."
  type        = string
  default     = null
}

variable "priority" {
  description = "Specifies the priority of this Virtual Machine."
  type        = string
  validation {
    condition = contains([
      "Regular", "Spot"
    ], title(var.priority))
    error_message = "Possible values can only be \"Regular\" or \"Spot\"."
  }
  default = "Regular"
}

variable "provision_vm_agent" {
  description = "Should the Azure VM Agent be provisioned on this Virtual Machine?"
  type        = bool
  validation {
    condition = contains([
      "true", "false"
    ], lower(tostring(var.provision_vm_agent)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
}

variable "proximity_placement_group_id" {
  description = "The ID of the Proximity Placement Group which the Virtual Machine should be assigned to."
  type        = string
  default     = null
}

variable "secret_block" {
  description = "A secret block."
  type = object({
    certificate = object({
      store = string
      url   = string
    })
    key_vault_id = string
  })
  default = null
}

variable "secure_boot_enabled" {
  description = "Specifies if Secure Boot and Trusted Launch is enabled for the Virtual Machine."
  type        = bool
  validation {
    condition = contains([
      "true", "false"
    ], lower(tostring(var.secure_boot_enabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = false
}

variable "source_image_id" {
  description = "The ID of the Image which this Virtual Machine should be created from."
  type        = string
  default     = null
}

variable "publisher" {
  description = "Specifies the publisher of the image used to create the virtual machines."
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "offer" {
  description = "Specifies the offer of the image used to create the virtual machines. "
  type        = string
  default     = "WindowsServer"
}

variable "sku" {
  description = "Specifies the SKU of the image used to create the virtual machines. "
  type        = string
  default     = "2019-Datacenter"
}

variable "image_reference_version" {
  description = "Specifies the version of the image used to create the virtual machines."
  type        = string
  default     = "latest"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}

variable "termination_notification_block" {
  description = "A termination_notification block."
  type = object({
    enabled = string
    timeout = optional(number)
  })
  default = null
}

variable "timezone" {
  description = "Specifies the Time Zone which should be used by the Virtual Machine."
  type        = string
  default     = "Romance Standard Time"
}

variable "user_data" {
  description = "The Base64-Encoded User Data which should be used for this Virtual Machine."
  type        = string
  default     = null
}

variable "virtual_machine_scale_set_id" {
  description = "Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within."
  type        = string
  default     = null
}

variable "vtpm_enabled" {
  description = "Specifies if vTPM (virtual Trusted Platform Module) and Trusted Launch is enabled for the Virtual Machine."
  type        = string
  default     = null
}

variable "winrm_listener_block" {
  description = "One or more winrm_listener blocks."
  type = list(object({
    protocol        = string
    certificate_url = optional(string)
  }))
  default = []
}

variable "zone" {
  description = "Specifies the Availability Zone in which this Windows Virtual Machine should be located."
  type        = string
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}

variable "key_vault_id" {
  description = "The key vault ID for the vault to store the credentials."
  type        = string
  default     = null
}

variable "application_id" {
  description = "The client id of the Azure user."
  type        = string
  default     = null
}

variable "certificate_permissions" {
  description = "List of certificate permissions."
  type        = set(string)
  validation {
    condition = alltrue([
      for certificate_permission in var.certificate_permissions : contains([
        "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers",
        "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"
      ], certificate_permission)
    ])
    error_message = "Parameter cam be one or combination of \"Backup\", \"Create\", \"Delete\", \"DeleteIssuers\", \"Get\", \"GetIssuers\", \"Import\", \"List\", \"ListIssuers\", \"ManageContacts\", \"ManageIssuers\", \"Purge\", \"Recover\", \"Restore\", \"SetIssuers\", \"Update\"."
  }
  default = [
    "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers",
    "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"
  ]
}

variable "key_permissions" {
  description = "List of certificate permissions."
  type        = set(string)
  validation {
    condition = alltrue([
      for key_permission in var.key_permissions : contains([
        "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore",
        "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy",
        "SetRotationPolicy"
      ], key_permission)
    ])
    error_message = "Parameter cam be one or combination of \"Backup\", \"Create\", \"Decrypt\", \"Delete\", \"Encrypt\", \"Get\", \"Import\", \"List\", \"Purge\", \"Recover\", \"Restore\", \"Sign\", \"UnwrapKey\", \"Update\", \"Verify\", \"WrapKey\", \"Release\", \"Rotate\", \"GetRotationPolicy\" and \"SetRotationPolicy\"."
  }
  default = [
    "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore",
    "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"
  ]
}

variable "secret_permissions" {
  description = "List of secret permissions."
  type        = set(string)
  validation {
    condition = alltrue([
      for secret_permission in var.secret_permissions : contains([
        "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
      ], secret_permission)
    ])
    error_message = "Parameter cam be one or combination of \"Backup\", \"Delete\", \"Get\", \"List\", \"Purge\", \"Recover\", \"Restore\" and \"Set\"."
  }
  default = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
}

variable "storage_permissions" {
  description = "List of storage permissions."
  type        = set(string)
  validation {
    condition = alltrue([
      for storage_permission in var.storage_permissions : contains([
        "Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey",
        "Restore", "Set", "SetSAS", "Update"
      ], storage_permission)
    ])
    error_message = "Parameter cam be one or combination of \"Backup\", \"Delete\", \"DeleteSAS\", \"Get\", \"GetSAS\", \"List\", \"ListSAS\", \"Purge\", \"Recover\", \"RegenerateKey\", \"Restore\", \"Set\", \"SetSAS\", \"Update\"."
  }
  default = [
    "Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey",
    "Restore", "Set", "SetSAS", "Update"
  ]
}

variable "administrator_username" {
  description = "The administrator login name for the new Windows VM."
  type        = string
  default     = "adminuser"
}

variable "administrator_password" {
  description = "The administrator login name for the new Windows VM."
  type        = string
  default     = null
}

variable "add_access_policy" {
  description = "If the technical user already exists in the vault we should not add the access policy."
  type        = bool
  default     = null
}

variable "aaDLoginForWindows" {
  description = "Enable AADLoginForWindows Active Directory Login"
  type        = bool
  validation {
    condition = contains([
      "true", "false"
    ], lower(tostring(var.aaDLoginForWindows)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
}

variable "aaDLoginForWindows_name" {
  description = "Name of AADLoginForWindows."
  type        = string
  default     = "AADLoginForWindows"
}

variable "aaDLoginForWindows_publisher" {
  description = "Publisher of AADLoginForWindows."
  type        = string
  default     = "Microsoft.Azure.ActiveDirectory"
}

variable "aaDLoginForWindows_type" {
  description = "Type of AADLoginForWindows."
  type        = string
  default     = "AADLoginForWindows"
}

variable "auto_upgrade_minor_version" {
  description = "VirtualMachineExtension auto upgrade minor version."
  type        = bool
  validation {
    condition = contains([
      "true", "false"
    ], lower(tostring(var.auto_upgrade_minor_version)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
}

variable "type_handler_version" {
  description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
  type        = string
  default     = "1.0"
}

variable "kv_access_policy" {
  description = "Enable access policy for the specific KV."
  type        = bool
  default     = null
}

variable "kv_role_definition_names" {
  description = "Specifies the role the user will get with the secret(s) in the vault."
  type        = list(string)
  default     = null
}