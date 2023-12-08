variable "name" {
  description = "Specifies the name of the network security group."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the supported Azure location where the resource exists. "
  type        = string
}

variable "location" {
  description = "The name of the resource group in which to create the network security group."
  type        = string
}

variable "type" {
  description = "The type of connection."
  type        = string
  validation {
    condition     = contains(["IPsec", "Vnet2Vnet", "ExpressRoute"], title(var.type))
    error_message = "Possible values can be \"IPsec\", \"Vnet2Vnet\" or \"ExpressRoute\"."
  }
  default = "IPsec"
}

variable "virtual_network_gateway_id" {
  description = "The ID of the Virtual Network Gateway in which the connection will be created."
  type        = string
}

variable "authorization_key" {
  description = "The authorization key associated with the Express Route Circuit."
  type        = string
  default     = null
}

variable "dpd_timeout_seconds" {
  description = "The dead peer detection timeout of this connection in seconds."
  type        = string
  default     = null
}

variable "express_route_circuit_id" {
  description = "The ID of the Express Route Circuit when creating an ExpressRoute connection (i.e. when type is ExpressRoute)."
  type        = string
  default     = null
}

variable "peer_virtual_network_gateway_id" {
  description = "The ID of the peer virtual network gateway when creating a VNet-to-VNet connection (i.e. when type is Vnet2Vnet)."
  type        = string
  default     = null
}

variable "local_azure_ip_address_enabled" {
  description = "Use private local Azure IP for the connection. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "local_network_gateway_id" {
  description = "The ID of the local network gateway when creating Site-to-Site connection (i.e. when type is IPsec)."
  type        = string
  default     = null
}

variable "routing_weight" {
  description = "The routing weight."
  type        = number
  default     = 10
}

variable "shared_key" {
  description = "The shared IPSec key. A key could be provided if a Site-to-Site, VNet-to-VNet or ExpressRoute connection is created."
  type        = string
  default     = null
}

variable "connection_mode" {
  description = "Connection mode to use."
  type        = string
  validation {
    condition     = contains(["Default", "InitiatorOnly", "ResponderOnly"], title(var.connection_mode))
    error_message = "Possible values can be \"Default\", \"InitiatorOnly\" or \"ResponderOnly\"."
  }
  default = "Default"
}

variable "connection_protocol" {
  description = "The IKE protocol version to use."
  type        = string
  validation {
    condition     = contains(["IKEv1", "IKEv2"], title(var.connection_protocol))
    error_message = "Possible values can be  \"IKEv1\" or \"IKEv2\"."
  }
  default = "IKEv2"
}

variable "enable_bgp" {
  description = "If true, BGP (Border Gateway Protocol) is enabled for this connection."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enable_bgp)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "custom_bgp_addresses_block" {
  description = "A custom_bgp_addresses (Border Gateway Protocol custom IP Addresses) block."
  type        = object({
    primary   = string
    secondary = string
  })
  default = null
}

variable "express_route_gateway_bypass" {
  description = "If true, data packets will bypass ExpressRoute Gateway for data forwarding This is only valid for ExpressRoute connections."
  type        = bool
  default     = null
}

variable "egress_nat_rule_ids" {
  description = "A list of the egress NAT Rule Ids."
  type        = list(string)
  default     = null
}

variable "ingress_nat_rule_ids" {
  description = "A list of the ingress NAT Rule Ids."
  type        = list(string)
  default     = null
}

variable "use_policy_based_traffic_selectors" {
  description = "If true, policy-based traffic selectors are enabled for this connection. Enabling policy-based traffic selectors requires an ipsec_policy block."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.use_policy_based_traffic_selectors)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "ipsec_policy_block" {
  description = "A ipsec_policy block."
  type        = object({
    dh_group         = string
    ike_encryption   = string
    ike_integrity    = string
    ipsec_encryption = string
    ipsec_integrity  = string
    pfs_group        = string
    sa_datasize      = optional(number)
    sa_lifetime      = optional(number)
  })
  default = null
}

variable "traffic_selector_policy_block" {
  description = "One or more traffic_selector_policy blocks."
  type        = map(object({
    local_address_cidrs  = list(string)
    remote_address_cidrs = list(string)
  }))
  default = {}
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