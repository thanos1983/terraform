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

variable "allocation_method" {
  description = "Defines the allocation method for this IP address."
  type        = string
  validation {
    condition     = contains(["Static", "Dynamic"], title(var.allocation_method))
    error_message = "Possible values can be \"Static\" or \"Dynamic\"."
  }
  default = "Static"
}

variable "zones" {
  description = "A collection containing the availability zone to allocate the Public IP in."
  type        = list(string)
  default     = null
}

variable "ddos_protection_mode" {
  description = "The DDoS protection mode of the public IP."
  type        = string
  validation {
    condition     = contains(["Disabled", "Enabled", "VirtualNetworkInherited"], title(var.ddos_protection_mode))
    error_message = "Possible values can be \"Disabled\", \"Enabled\" or \"VirtualNetworkInherited\"."
  }
  default = "VirtualNetworkInherited"
}

variable "ddos_protection_plan_id" {
  description = "The ID of DDoS protection plan associated with the public IP. "
  type        = string
  default     = null
}

variable "domain_name_label" {
  description = "Label for the Domain Name."
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Public IP should exist."
  type        = string
  default     = null
}

variable "idle_timeout_in_minutes" {
  description = "Specifies the timeout for the TCP idle connection."
  type        = number
  validation {
    condition = (
    var.idle_timeout_in_minutes >= 4 &&
    var.idle_timeout_in_minutes <= 30
    )
    error_message = "Possible values can be between \"4\" to \"30\" minutes."
  }
  default = 4
}

variable "ip_tags" {
  description = "A mapping of IP tags to assign to the public IP."
  type        = map(any)
  default     = null
}

variable "ip_version" {
  description = "The IP Version to use, IPv6 or IPv4."
  type        = string
  validation {
    condition     = contains(["IPv4", "IPv6"], title(var.ip_version))
    error_message = "Possible values can be \"IPv4\" or \"IPv6\"."
  }
  default = "IPv4"
}

variable "public_ip_prefix_id" {
  description = "If specified then public IP address allocated will be provided from the public IP prefix resource."
  type        = string
  default     = null
}

variable "reverse_fqdn" {
  description = "A fully qualified domain name that resolves to this public IP address."
  type        = string
  default     = null
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

variable "sku_tier" {
  description = "The SKU Tier that should be used for the Public IP."
  type        = string
  validation {
    condition     = contains(["Regional", "Global"], title(var.sku_tier))
    error_message = "Possible values can be \"Regional\" or \"Global\"."
  }
  default = "Regional"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
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