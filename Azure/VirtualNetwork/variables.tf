variable "name" {
  description = "Specifies the name of the network security group."
  type        = string
}

variable "resources_group_name" {
  description = "Specifies the supported Azure location where the resource exists. "
  type        = string
}

variable "address_space" {
  description = "The address space that is used the virtual network. You can supply more than one address space."
  type        = list(string)
}

variable "location" {
  description = "The name of the resource group in which to create the network security group."
  type        = string
}

variable "bgp_community" {
  description = "The BGP community attribute in format <as-number>:<community-value>."
  type        = string
  default     = null
}

variable "ddos_protection_plan_block" {
  description = " A ddos_protection_plan block."
  type        = object({
    id     = string
    enable = bool
  })
  default = null
}

variable "dns_server" {
  description = "List of IP addresses of DNS servers."
  type        = set(string)
  default     = null
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Virtual Network should exist."
  type        = string
  default     = null
}

variable "flow_timeout_in_minutes" {
  description = "The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows."
  type        = number
  validation {
    condition     = var.flow_timeout_in_minutes >= 4 && var.flow_timeout_in_minutes <= 30
    error_message = "Accepted values: 4-30."
  }
  default = 4
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

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
}
