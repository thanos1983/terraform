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

variable "address_prefix" {
  description = "The Address Prefix which should be used for this Virtual Hub."
  type        = string
}

variable "hub_routing_preference" {
  description = "The hub routing preference."
  type        = string
  validation {
    condition     = contains(["ExpressRoute", "ASPath", "VpnGateway"], title(var.hub_routing_preference))
    error_message = "Possible values can be \"ExpressRoute\", \"ASPath\" or \"VpnGateway\"."
  }
  default = "ExpressRoute"
}

variable "route_block" {
  description = "One or more route blocks."
  type = list(object({
    address_prefixes    = list(string)
    next_hop_ip_address = string
  }))
  default = []
}

variable "sku" {
  description = "The SKU of the Virtual Hub."
  type        = string
  validation {
    condition     = contains(["Basic", "Standard"], title(var.sku))
    error_message = "Possible values can be \"Basic\" or \"Standard\"."
  }
  default = "Standard"
}

variable "virtual_wan_id" {
  description = "The ID of a Virtual WAN within which the Virtual Hub should be created."
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
