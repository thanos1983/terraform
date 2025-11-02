variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where this Public IP should exist."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the Public IP should exist."
  type        = string
}

variable "copy_paste_enabled" {
  description = "Is Copy/Paste feature enabled for the Bastion Host."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.copy_paste_enabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "file_copy_enabled" {
  description = "Is File Copy feature enabled for the Bastion Host."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.file_copy_enabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "sku" {
  description = "The SKU of the Public IP."
  type        = string
  validation {
    condition     = contains(["Basic", "Standard"], title(var.sku))
    error_message = "Possible values can be \"Basic\" or \"Standard\"."
  }
  default = "Basic"
}

variable "ip_configuration_name" {
  description = "The ip_configuration name."
  type        = string
}

variable "ip_configuration_subnet_id" {
  description = "The ip_configuration subnet id."
  type        = string
}

variable "ip_configuration_public_ip_address_id" {
  description = "The ip_configuration public ip address id."
  type        = string
}

variable "ip_connect_enabled" {
  description = "Is IP Connect feature enabled for the Bastion Host."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.ip_connect_enabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "scale_units" {
  description = "The number of scale units with which to provision the Bastion Host."
  type        = number
  validation {
    condition = (
      var.scale_units >= 2 &&
      var.scale_units <= 50
    )
    error_message = "Value must be between 2 and 50 scale units."
  }
  default = 2
}

variable "shareable_link_enabled" {
  description = "Is Shareable Link feature enabled for the Bastion Host."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.shareable_link_enabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "tunneling_enabled" {
  description = "Is Tunneling feature enabled for the Bastion Host."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.tunneling_enabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
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
