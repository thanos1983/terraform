variable "name" {
  description = "Specifies the name of the Managed Disk."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Managed Disk should exist."
  type        = string
}

variable "location" {
  description = "Specified the supported Azure location where the resource exists."
  type        = string
}

variable "storage_account_type" {
  description = "The type of storage to use for the managed disk."
  type        = string
}

variable "create_option" {
  description = "The method to use when creating the managed disk."
  type        = string
}

variable "disk_encryption_set_id" {
  description = "The ID of a Disk Encryption Set which should be used to encrypt this Managed Disk."
  type        = string
  default     = null
}

variable "disk_iops_read_write" {
  description = "The number of IOPS allowed for this disk."
  type        = number
  default     = 1
}

variable "disk_mbps_read_write" {
  description = "The bandwidth allowed for this disk."
  type        = number
  default     = 1
}

variable "disk_iops_read_only" {
  description = "The number of IOPS allowed across all VMs mounting the shared disk as read-only."
  type        = number
  default     = 1
}

variable "disk_mbps_read_only" {
  description = "The bandwidth allowed across all VMs mounting the shared disk as read-only."
  type        = number
  default     = 1
}

variable "upload_size_bytes" {
  description = "Specifies the size of the managed disk to create in bytes."
  type        = number
  default     = null
}

variable "disk_size_gb" {
  description = "Specifies the size of the managed disk to create in gigabytes."
  type        = number
  default     = null
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Managed Disk should exist."
  type        = string
  default     = null
}

variable "encryption_settings_block" {
  description = "A encryption_settings block as defined below."
  type = object({
    disk_encryption_key_block = optional(object({
      secret_url      = string
      source_vault_id = string
    }))
    key_encryption_key_block = optional(object({
      key_url         = string
      source_vault_id = string
    }))
  })
  default = null
}

variable "hyper_v_generation" {
  description = "The HyperV Generation of the Disk when the source of an Import or Copy operation targets a source that contains an operating system."
  type        = string
  default     = null
}

variable "image_reference_id" {
  description = "ID of an existing platform/marketplace disk image to copy when create_option is FromImage."
  type        = string
  default     = null
}

variable "gallery_image_reference_id" {
  description = "ID of a Gallery Image Version to copy when create_option is FromImage."
  type        = string
  default     = null
}

variable "logical_sector_size" {
  description = "Logical Sector Size."
  type        = number
  default     = 4096
}

variable "optimized_frequent_attach_enabled" {
  description = "Specifies whether this Managed Disk should be optimized for frequent disk attachments (where a disk is attached/detached more than 5 times in a day)."
  type        = bool
  default     = false
}

variable "performance_plus_enabled" {
  description = "Specifies whether Performance Plus is enabled for this Managed Disk."
  type        = bool
  default     = false
}

variable "os_type" {
  description = "Specify a value when the source of an Import, ImportSecure or Copy operation targets a source that contains an operating system."
  type        = string
  default     = "Linux"
}

variable "source_resource_id" {
  description = "The ID of an existing Managed Disk or Snapshot to copy when create_option is Copy or the recovery point to restore when create_option is Restore."
  type        = string
  default     = null
}

variable "source_uri" {
  description = "URI to a valid VHD file to be used when create_option is Import or ImportSecure."
  type        = string
  default     = null
}

variable "storage_account_id" {
  description = "The ID of the Storage Account where the source_uri is located."
  type        = string
  default     = null
}

variable "tier" {
  description = "The disk performance tier to use."
  type        = string
  default     = null
}

variable "max_shares" {
  description = "The maximum number of VMs that can attach to the disk at the same time."
  type        = number
  default     = null
}

variable "trusted_launch_enabled" {
  description = "Specifies if Trusted Launch is enabled for the Managed Disk."
  type        = bool
  default     = false
}

variable "security_type" {
  description = "Security Type of the Managed Disk when it is used for a Confidential VM."
  type        = string
  default     = null
}

variable "secure_vm_disk_encryption_set_id" {
  description = "The ID of the Disk Encryption Set which should be used to Encrypt this OS Disk when the Virtual Machine is a Confidential VM."
  type        = string
  default     = null
}

variable "on_demand_bursting_enabled" {
  description = "Specifies if On-Demand Bursting is enabled for the Managed Disk."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type = map(string)
  default     = null
}

variable "zone" {
  description = "Specifies the Availability Zone in which this Managed Disk should be located."
  type        = string
  default     = null
}

variable "network_access_policy" {
  description = "Policy for accessing the disk via network."
  type        = string
  default     = null
}

variable "disk_access_id" {
  description = "The ID of the disk access resource for using private endpoints on disks."
  type        = string
  default     = null
}

variable "public_network_access_enabled" {
  description = "Whether it is allowed to access the disk via public network."
  type        = bool
  default     = true
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