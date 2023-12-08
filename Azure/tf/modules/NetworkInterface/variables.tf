variable "ip_configuration_blocks" {
  description = "IP configuration block(s)."
  type = list(object({
    name                                               = string
    primary                                            = optional(bool)
    subnet_id                                          = optional(string)
    private_ip_address                                 = optional(string)
    public_ip_address_id                               = optional(string)
    private_ip_address_version                         = optional(string)
    private_ip_address_allocation                      = string
    gateway_load_balancer_frontend_ip_configuration_id = optional(string)
  }))
  default = null
}

variable "location" {
  description = "The location where the Network Interface should exist."
  type        = string
}

variable "name" {
  description = "The name of the Network Interface."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which to create the Network Interface."
  type        = string
}

variable "auxiliary_mode" {
  description = "Specifies the auxiliary mode used to enable network high-performance feature on Network Virtual Appliances (NVAs)."
  type        = string
  default     = null
}

variable "auxiliary_sku" {
  description = "Specifies the SKU used for the network high-performance feature on Network Virtual Appliances (NVAs)."
  type        = string
  default     = null
}

variable "dns_servers" {
  description = "A list of IP Addresses defining the DNS Servers which should be used for this Network Interface."
  type        = list(string)
  default     = null
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Network Interface should exist."
  type        = string
  default     = null
}

variable "enable_ip_forwarding" {
  description = "Should IP Forwarding be enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enable_ip_forwarding)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "enable_accelerated_networking" {
  description = "Should Accelerated Networking be enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enable_accelerated_networking)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "internal_dns_name_label" {
  description = "The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network."
  type        = string
  default     = null
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