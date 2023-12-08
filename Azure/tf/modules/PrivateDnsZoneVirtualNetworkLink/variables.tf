variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "private_dns_zone_name" {
  description = "The name of the Private DNS zone (without a terminating dot)."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where this Public IP should exist."
  type        = string
}

variable "virtual_network_id" {
  description = "The ID of the Virtual Network that should be linked to the DNS Zone."
  type        = string
}

variable "registration_enabled" {
  description = "Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.registration_enabled)))
    error_message = "Parameter must be \"true\" or \"false\"."
  }
  default = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}