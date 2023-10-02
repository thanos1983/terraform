variable "name" {
  description = "Specifies the name of the network security group."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "location" {
  description = "The name of the resource group in which to create the network security group."
  type        = string
}

variable "address_space" {
  description = "The list of string CIDRs representing the address spaces the gateway exposes."
  type        = list(string)
  default     = null
}

variable "bgp_settings_block" {
  description = "A bgp_settings block."
  type        = object({
    asn                 = string
    bgp_peering_address = string
    peer_weight         = optional(string)
  })
  default = null
}

variable "gateway_address" {
  description = "The gateway IP address to connect with."
  type        = string
  default     = null
}

variable "gateway_fqdn" {
  description = "The gateway FQDN to connect with."
  type        = string
  default     = null
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