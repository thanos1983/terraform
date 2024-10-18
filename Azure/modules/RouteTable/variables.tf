variable "name" {
  description = "Specifies the name of this User Assigned Identity."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "route_blocks" {
  description = "List of objects representing routes."
  type = list(object({
    name           = string
    address_prefix = string
    next_hop_type  = string
    next_hop_in_ip_address = optional(string)
  }))
  default = null
}

variable "disable_bgp_route_propagation" {
  description = "Boolean flag which controls propagation of routes learned by BGP on that route table."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.disable_bgp_route_propagation)))
    error_message = "Boolean flag must be \"true\" or \"false\"."
  }
  default = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type = map(any)
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