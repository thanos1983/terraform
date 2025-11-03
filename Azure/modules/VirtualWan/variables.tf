variable "name" {
  description = "Specifies the name of the network security group."
  type        = string
}

variable "resources_group_name" {
  description = "Specifies the supported Azure location where the resource exists. "
  type        = string
}

variable "location" {
  description = "The name of the resource group in which to create the network security group."
  type        = string
}

variable "disable_vpn_encryption" {
  description = "Boolean flag to specify whether VPN encryption is disabled."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.disable_vpn_encryption)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "allow_branch_to_branch_traffic" {
  description = "Boolean flag to specify whether branch to branch traffic is allowed."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.allow_branch_to_branch_traffic)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "office365_local_breakout_category" {
  description = "Boolean flag to specify whether branch to branch traffic is allowed."
  type        = string
  validation {
    condition = contains([
      "Optimize", "OptimizeAndAllow", "All", "None"
    ], title(var.office365_local_breakout_category))
    error_message = "Possible values can be \"Optimize\", \"OptimizeAndAllow\", \"All\" or \"None\"."
  }
  default = "None"
}

variable "type" {
  description = "Specifies the Virtual WAN type."
  type        = string
  validation {
    condition     = contains(["Basic", "Standard"], title(var.type))
    error_message = "Possible values can be \"Basic\" or \"Standard\"."
  }
  default = "Standard"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
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
