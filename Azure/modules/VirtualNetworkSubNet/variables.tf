variable "name" {
  description = "The name of the subnet."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the subnet."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network to which to attach the subnet."
  type        = string
}

variable "address_prefixes" {
  description = "The address prefixes to use for the subnet."
  type = list(any)
}

variable "delegation_blocks" {
  description = "One or more delegation blocks."
  type = list(object({
    name = string
    service_delegation_block = object({
      name = string
      actions = list(string)
    })
  }))
  default = []
}

variable "default_outbound_access_enabled" {
  description = "Enable default outbound access to the internet for the subnet."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.default_outbound_access_enabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
}

variable "private_endpoint_network_policies" {
  description = "Enable or Disable network policies for the private endpoint on the subnet."
  type        = string
  validation {
    condition = contains([
      "Disabled", "Enabled", "NetworkSecurityGroupEnabled", "RouteTableEnabled"
    ], title(var.private_endpoint_network_policies))
    error_message = "Possible values can only be \"Disabled\", \"Enabled\", \"NetworkSecurityGroupEnabled\" or \"RouteTableEnabled\"."
  }
  default = "Disabled"
}

variable "private_link_service_network_policies_enabled" {
  description = "Enable or Disable network policies for the private link service on the subnet."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.private_link_service_network_policies_enabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet."
  type = list(string)
  default = []
}

variable "service_endpoint_policy_ids" {
  description = "The list of IDs of Service Endpoint Policies to associate with the subnet."
  type = list(string)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}