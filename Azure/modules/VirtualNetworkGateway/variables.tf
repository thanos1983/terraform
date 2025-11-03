variable "ip_configuration_block" {
  description = "The ip_configuration block (1 to 3)."
  type = list(object({
    name                          = optional(string)
    private_ip_address_allocation = optional(string)
    subnet_id                     = string
    public_ip_address_id          = string
  }))
  default = []
}

variable "location" {
  description = "The name of the resource group in which to create the network security group."
  type        = string
}

variable "name" {
  description = "Specifies the name of the network security group."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the supported Azure location where the resource exists. "
  type        = string
}

variable "sku" {
  description = "Configuration of the size and capacity of the virtual network gateway."
  type        = string
}

variable "type" {
  description = "The type of the Virtual Network Gateway."
  type        = string
  validation {
    condition     = contains(["Vpn", "ExpressRoute"], title(var.type))
    error_message = "Possible values can be \"Vpn\" or \"ExpressRoute\"."
  }
  default = "Vpn"
}

variable "active_active" {
  description = "If true, an active-active Virtual Network Gateway will be created."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.active_active)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "default_local_network_gateway_id" {
  description = "The ID of the local network gateway through which outbound Internet traffic from the virtual network in which the gateway is created will be routed (forced tunnelling)."
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Virtual Network Gateway should exist."
  type        = string
  default     = null
}

variable "enable_bgp" {
  description = "If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enable_bgp)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "bgp_settings_block" {
  description = "A bgp_settings block."
  type = object({
    asn         = optional(string)
    peer_weight = optional(string)
    peering_addresses = optional(list(object({
      ip_configuration_name = optional(string)
      apipa_addresses       = optional(list(string))
    })))
  })
  default = null
}

variable "custom_route_block" {
  description = "A custom_route block."
  type = object({
    address_prefixes = optional(list(string))
  })
  default = null
}

variable "generation" {
  description = "The Generation of the Virtual Network gateway."
  type        = string
  validation {
    condition     = contains(["Generation1", "Generation2", "None"], title(var.generation))
    error_message = "Possible values can be \"Generation1\", \"Generation2\" or \"None\"."
  }
  default = "Generation1"
}

variable "private_ip_address_enabled" {
  description = "Should private IP be enabled on this gateway for connections?"
  type        = bool
  default     = null
}

variable "vpn_client_configuration_block" {
  description = "A vpn_client_configuration block."
  type = object({
    address_space = string
    aad_tenant    = optional(string)
    aad_audience  = optional(string)
    aad_issuer    = optional(string)
    root_certificate = optional(map(object({
      name             = string
      public_cert_data = string
    })))
    revoked_certificate = optional(map(object({
      name       = string
      thumbprint = string
    })))
    radius_server_address = optional(string)
    radius_server_secret  = optional(string)
    vpn_client_protocols  = optional(list(string))
    vpn_auth_types        = optional(list(string))
  })
  default = null
}

variable "vpn_type" {
  description = "The routing type of the Virtual Network Gateway."
  type        = string
  validation {
    condition     = contains(["RouteBased", "PolicyBased"], title(var.vpn_type))
    error_message = "Possible values can be \"RouteBased\" or \"PolicyBased\"."
  }
  default = "RouteBased"
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
