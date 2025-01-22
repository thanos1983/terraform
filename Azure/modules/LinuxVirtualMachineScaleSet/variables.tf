variable "name" {
  description = "The name of the Windows Virtual Machine."
  type        = string
}

variable "location" {
  description = "The Azure location where the Windows Virtual Machine should exist."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the Windows Virtual Machine should be exist."
  type        = string
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine."
  type        = string
  default     = "adminuser"
}

variable "instances" {
  description = "The number of Virtual Machines in the Scale Set."
  type        = number
  default     = 0
}

variable "sku" {
  description = "The Virtual Machine SKU for the Scale Set, such as Standard_F2."
  type        = string
}

variable "network_interface_blocks" {
  description = "One or more network_interface blocks as defined below."
  type = list(object({
    name = string
    ip_configuration_blocks = list(object({
      name = string
      application_gateway_backend_address_pool_ids = optional(list(string), [])
      application_security_group_ids = optional(list(string), [])
      load_balancer_backend_address_pool_ids = optional(list(string), [])
      load_balancer_inbound_nat_rules_ids = optional(list(string), [])
      primary = optional(bool, false)
      public_ip_address_block = optional(object({
        name = string
        domain_name_label = optional(string, null)
        idle_timeout_in_minutes = optional(number, 4)
        ip_tag_block = optional(object({
          tag  = string
          type = string
        }), null)
        public_ip_prefix_id = optional(string, null)
        version = optional(string, "IPv4")
      }), null)
      subnet_id = optional(string, null)
      version = optional(string, "IPv4")
    }))
    dns_servers = optional(list(string), [])
    enable_accelerated_networking = optional(bool, false)
    enable_ip_forwarding = optional(bool, false)
    primary = optional(bool, false)
  }))
}

variable "os_disk_block" {
  description = "A os_disk block supports the following."
  type = object({
    caching              = string
    storage_account_type = string
    diff_disk_settings_block = optional(object({
      option = string
      placement = optional(string, "CacheDisk")
    }), null)
    disk_encryption_set_id = optional(string)
    disk_size_gb = optional(number)
    secure_vm_disk_encryption_set_id = optional(string)
    security_encryption_type = optional(string)
    write_accelerator_enabled = optional(string)
  })
}

variable "additional_capabilities_block" {
  description = "A additional_capabilities block."
  type = object({
    ultra_ssd_enabled = optional(bool, false)
  })
  default = null
}

variable "admin_password" {
  description = "The Password which should be used for the local-administrator on this Virtual Machine."
  type        = string
  default     = null
}

variable "admin_ssh_key_blocks" {
  description = "One or more admin_ssh_key blocks as defined below."
  type = list(object({
    public_key = string
    username   = string
  }))
  default = []
}

variable "automatic_os_upgrade_policy_block" {
  description = "An automatic_os_upgrade_policy block as defined below."
  type = object({
    disable_automatic_rollback  = bool
    enable_automatic_os_upgrade = bool
  })
  default = null
}

variable "automatic_instance_repair_block" {
  description = "An automatic_os_upgrade_policy block as defined below."
  type = object({
    enabled = bool
    grace_period = optional(string, "PT10M")
    action = optional(string)
  })
  default = null
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

variable "computer_name_prefix" {
  description = "The prefix which should be used for the name of the Virtual Machines in this Scale Set."
  type        = string
  default     = null
}

variable "custom_data" {
  description = "The Base64-Encoded Custom Data which should be used for this Virtual Machine."
  type        = string
  default     = null
}

variable "data_disk_blocks" {
  description = "One or more data_disk blocks as defined below."
  type = list(object({
    name = optional(string, null)
    caching              = string
    create_option = optional(string, "Empty")
    disk_size_gb         = number
    lun                  = number
    storage_account_type = string
    disk_encryption_set_id = optional(string, null)
    ultra_ssd_disk_iops_read_write = optional(string, null)
    ultra_ssd_disk_mbps_read_write = optional(string, null)
    write_accelerator_enabled = optional(bool, false)
  }))
  default = []
}

variable "disable_password_authentication" {
  description = "Should Password Authentication be disabled on this Virtual Machine?"
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.disable_password_authentication)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "do_not_run_extensions_on_overprovisioned_machines" {
  description = "Should Virtual Machine Extensions be run on Overprovisioned Virtual Machines in the Scale Set?"
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.do_not_run_extensions_on_overprovisioned_machines)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Windows Virtual Machine should exist."
  type        = string
  default     = null
}

variable "encryption_at_host_enabled" {
  description = "Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?"
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.encryption_at_host_enabled)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "extension_blocks" {
  description = "One or more extension blocks as defined below."
  type = list(object({
    name                 = string
    publisher            = string
    type                 = string
    type_handler_version = string
    auto_upgrade_minor_version = optional(bool, true)
    automatic_upgrade_enabled = optional(bool, false)
    force_update_tag = optional(string, null)
    protected_settings = optional(string, null)
    protected_settings_from_key_vault_block = optional(object({
      secret_url      = string
      source_vault_id = string
    }), null)
    provision_after_extensions = optional(list(string), [])
    settings = optional(string, null)
  }))
  default = []
}

variable "extension_operations_enabled" {
  description = "Should extension operations be allowed on the Virtual Machine Scale Set?"
  validation {
    condition = contains(["true", "false"], lower(tostring(var.extension_operations_enabled)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  type    = bool
  default = true
}

variable "extensions_time_budget" {
  description = "Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to 90 minutes (PT1H30M)."
  type        = string
  default     = "PT1H30M"
}

variable "eviction_policy" {
  description = "Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance."
  type        = string
  default     = null
}

variable "gallery_application_blocks" {
  description = "One or more gallery_application blocks."
  type = list(object({
    version_id = string
    configuration_blob_uri = optional(string)
    order = optional(number)
    tag = optional(string)
  }))
  default = []
}

variable "health_probe_id" {
  description = "The ID of a Load Balancer Probe which should be used to determine the health of an instance."
  type        = string
  default     = null
}

variable "host_group_id" {
  description = "Specifies the ID of the dedicated host group that the virtual machine scale set resides in."
  type        = string
  default     = null
}

variable "identity_block" {
  description = "An identity block as defined below."
  type = object({
    type = string
    identity_ids = optional(list(string))
  })
  default = {
    type = "SystemAssigned"
  }
}

variable "max_bid_price" {
  description = "The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price."
  type        = string
  default     = "-1"
}

variable "overprovision" {
  description = "Should Azure over-provision Virtual Machines in this Scale Set?"
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.overprovision)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
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

variable "platform_fault_domain_count" {
  description = "Specifies the Platform Fault Domain in which this Windows Virtual Machine should be created."
  type        = number
  default     = null
}

variable "priority" {
  description = "Specifies the priority of this Virtual Machine."
  type        = string
  validation {
    condition = contains(["Regular", "Spot"], title(var.priority))
    error_message = "Possible values can only be \"Regular\" or \"Spot\"."
  }
  default = "Regular"
}

variable "provision_vm_agent" {
  description = "Should the Azure VM Agent be provisioned on this Virtual Machine?"
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.provision_vm_agent)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
}

variable "proximity_placement_group_id" {
  description = "The ID of the Proximity Placement Group which the Virtual Machine should be assigned to."
  type        = string
  default     = null
}

variable "rolling_upgrade_policy_block" {
  description = "A rolling_upgrade_policy block as defined below."
  type = object({
    cross_zone_upgrades_enabled = optional(bool, false)
    max_batch_instance_percent              = number
    max_unhealthy_instance_percent          = number
    max_unhealthy_upgraded_instance_percent = number
    pause_time_between_batches              = string
    prioritize_unhealthy_instances_enabled = optional(bool, true)
    maximum_surge_instances_enabled = optional(bool, true)
  })
  default = null
}

variable "scale_in_block" {
  description = "A scale_in block as defined below."
  type = object({
    rule = optional(string, "Default")
    force_deletion_enabled = optional(bool, false)
  })
  default = null
}

variable "secret_blocks" {
  description = "One or more secret blocks as defined below."
  type = list(object({
    certificate_blocks = object({
      url = string
    })
    key_vault_id = string
  }))
  default = []
}

variable "secure_boot_enabled" {
  description = "Specifies if Secure Boot and Trusted Launch is enabled for the Virtual Machine."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.secure_boot_enabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = false
}

variable "single_placement_group" {
  description = "Should this Virtual Machine Scale Set be limited to a Single Placement Group, which means the number of instances will be capped at 100 Virtual Machines."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.single_placement_group)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
}

variable "source_image_id" {
  description = "The ID of the Image which this Virtual Machine should be created from."
  type        = string
  default     = null
}

variable "source_image_reference_block" {
  description = "A source_image_reference block as defined below."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = null
}

variable "spot_restore_block" {
  description = "A spot_restore block as defined below."
  type = object({
    enabled = optional(bool, false)
    timeout = optional(string, "PT1H")
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type = map(any)
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

variable "upgrade_mode" {
  description = "Specifies how Upgrades (e.g. changing the Image/SKU) should be performed to Virtual Machine Instances."
  type        = string
  validation {
    condition = contains(["Automatic", "Manual", "Rolling"], title(var.upgrade_mode))
    error_message = "Possible values can only be \"Automatic\", \"Manual\" or \"Rolling\"."
  }
  default = "Manual"
}

variable "user_data" {
  description = "The Base64-Encoded User Data which should be used for this Virtual Machine."
  type        = string
  default     = null
}

variable "vtpm_enabled" {
  description = "Specifies if vTPM (virtual Trusted Platform Module) and Trusted Launch is enabled for the Virtual Machine."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.vtpm_enabled)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "zone_balance" {
  description = "Should the Virtual Machines in this Scale Set be strictly evenly distributed across Availability Zones?"
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.zone_balance)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "zones" {
  description = "Specifies a list of Availability Zones in which this Linux Virtual Machine Scale Set should be located."
  type = list(string)
  default = []
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
    condition = contains(["true", "false"], lower(tostring(var.lower)))
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
    condition = contains(["true", "false"], lower(tostring(var.numeric)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "special" {
  description = "Include special characters in the result."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.special)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "upper" {
  description = "Include uppercase alphabet characters in the result."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.upper)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "caching" {
  description = "The Type of Caching which should be used for the Internal OS Disk."
  type        = string
  validation {
    condition = contains(["None", "ReadOnly", "ReadWrite"], title(var.caching))
    error_message = "Kind of account must be \"None\", \"ReadOnly\" or \"ReadWrite\"."
  }
  default = "ReadWrite"
}

variable "storage_account_type" {
  description = "The Type of Storage Account which should back this the Internal OS Disk."
  type        = string
  validation {
    condition = contains(["Standard_LRS", "StandardSSD_LRS", "Premium_LRS"], title(var.storage_account_type))
    error_message = "Storage account type can only be \"Standard_LRS\", \"StandardSSD_LRS\", \"Premium_LRS\", \"StandardSSD_ZRS\" or \"Premium_ZRS\"."
  }
  default = "Premium_LRS"
}

variable "diff_disk_settings_block" {
  description = "A diff_disk_settings block as defined above. "
  type = object({
    option = string
    placement = optional(string)
  })
  default = null
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

variable "image_reference_version" {
  description = "Specifies the version of the image used to create the virtual machines."
  type        = string
  default     = "latest"
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read = optional(number, 5)
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

variable "tenant_id" {
  description = "The tenant id of the Azure KV of this VM."
  type        = string
  default     = null
}

variable "object_id" {
  description = "The object id of the Azure KV of this VM."
  type        = string
  default     = null
}

variable "application_id" {
  description = "The client id of the Azure user."
  type        = string
  default     = null
}

variable "secret_permissions" {
  description = "List of secret permissions."
  type = list(string)
  default = []
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

variable "aaDSSHLoginForLinux" {
  description = "Enable SSH login for Linux."
  type        = bool
  validation {
    condition = contains([
      "true", "false"
    ], lower(tostring(var.aaDSSHLoginForLinux)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = false
}

variable "aaDSSHLoginForLinux_name" {
  description = "Name of AADSSHLoginForLinux."
  type        = string
  default     = "AADSSHLoginForLinux"
}

variable "aaDSSHLoginForLinux_publisher" {
  description = "Publisher of AADSSHLoginForLinux ."
  type        = string
  default     = "Microsoft.Azure.ActiveDirectory"
}

variable "aaDSSHLoginForLinux_type" {
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

variable "role_definition_names" {
  description = "Specifies the role the user will get with the secret(s) in the vault."
  type = list(string)
  default = []
}

variable "role_assignment_name" {
  description = "A unique UUID/GUID for this Role Assignment - one will be generated if not specified."
  type        = string
  default     = null
}

variable "role_definition_ids" {
  description = "The Scoped-ID(s) of the Role Definition."
  type = list(string)
  default = []
}

variable "principal_id" {
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to."
  type        = string
  default     = null
}