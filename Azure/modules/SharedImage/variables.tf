variable "name" {
  description = "Specifies the name of the Shared Image."
  type        = string
}

variable "gallery_name" {
  description = "Specifies the name of the Shared Image Gallery in which this Shared Image should exist."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Shared Image Gallery exists."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the Shared Image Gallery exists."
  type        = string
}

variable "identifier_block" {
  description = "An identifier block as defined below."
  type = object({
    offer     = string
    publisher = string
    sku       = string
  })
}

variable "os_type" {
  description = "The type of Operating System present in this Shared Image."
  type        = string
}

variable "purchase_plan_block" {
  description = "A purchase_plan block as defined below."
  type = object({
    name      = string
    publisher = string
    product   = string
  })
  default = null
}

variable "description" {
  description = "A description of this Shared Image."
  type        = string
  default     = null
}

variable "disk_types_not_allowed" {
  description = "One or more Disk Types not allowed for the Image."
  type        = string
  default     = null
}

variable "end_of_life_date" {
  description = "The end of life date in RFC3339 format of the Image."
  type        = string
  default     = null
}

variable "eula" {
  description = "The End User Licence Agreement for the Shared Image."
  type        = string
  default     = null
}

variable "specialized" {
  description = "Specifies that the Operating System used inside this Image has not been Generalized (for example, sysprep on Windows has not been run)."
  type        = string
  default     = null
}

variable "architecture" {
  description = "CPU architecture supported by an OS."
  type        = string
  validation {
    condition     = contains(["x64", "Arm64"], (var.architecture))
    error_message = "Boolean flag must be 'x64' or 'Arm64'."
  }
  default = "x64"
}

variable "hyper_v_generation" {
  description = "The generation of HyperV that the Virtual Machine used to create the Shared Image is based on."
  type        = string
  validation {
    condition     = contains(["V1", "V2"], (var.hyper_v_generation))
    error_message = "Boolean flag must be 'V1' or 'V2'."
  }
  default = "V1"
}

variable "max_recommended_vcpu_count" {
  description = "Maximum count of vCPUs recommended for the Image."
  type        = number
  default     = null
}

variable "min_recommended_vcpu_count" {
  description = "Minimum count of vCPUs recommended for the Image."
  type        = number
  default     = null
}

variable "max_recommended_memory_in_gb" {
  description = "Maximum memory in GB recommended for the Image."
  type        = number
  default     = null
}

variable "min_recommended_memory_in_gb" {
  description = "Minimum memory in GB recommended for the Image."
  type        = number
  default     = null
}

variable "privacy_statement_uri" {
  description = "The URI containing the Privacy Statement associated with this Shared Image."
  type        = string
  default     = null
}

variable "release_note_uri" {
  description = "The URI containing the Release Notes associated with this Shared Image."
  type        = string
  default     = null
}

variable "trusted_launch_supported" {
  description = "Specifies if supports creation of both Trusted Launch virtual machines and Gen2 virtual machines with standard security created from the Shared Image."
  type        = string
  default     = null
}

variable "trusted_launch_enabled" {
  description = "Specifies if Trusted Launch has to be enabled for the Virtual Machine created from the Shared Image."
  type        = bool
  default     = null
}

variable "confidential_vm_supported" {
  description = "Specifies if supports creation of both Confidential virtual machines and Gen2 virtual machines with standard security from a compatible Gen2 OS disk VHD or Gen2 Managed image."
  type        = string
  default     = null
}

variable "confidential_vm_enabled" {
  description = "Specifies if Confidential Virtual Machines enabled."
  type        = bool
  default     = null
}

variable "accelerated_network_support_enabled" {
  description = "Specifies if the Shared Image supports Accelerated Network."
  type        = bool
  default     = null
}

variable "hibernation_enabled" {
  description = "Specifies if the Shared Image supports hibernation."
  type        = bool
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the Shared Image Gallery."
  type        = map(string)
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
