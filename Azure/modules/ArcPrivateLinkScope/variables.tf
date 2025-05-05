variable "location" {
  description = "The Azure Region where the Arc Private Link Scope should exist."
  type        = string
}

variable "name" {
  description = "The name which should be used for the Azure Arc Private Link Scope."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Azure Arc Private Link Scope should exist."
  type        = string
}

variable "public_network_access_enabled" {
  description = "Indicates whether machines associated with the private link scope can also use public Azure Arc service endpoints."
  type        = string
  default     = false
}

variable "tags" {
  description = " A mapping of tags which should be assigned to the Azure Arc Private Link Scope."
  type        = string
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 20)
    read = optional(number, 5)
    update = optional(number, 20)
    delete = optional(number, 5)
  })
  default = null
}
