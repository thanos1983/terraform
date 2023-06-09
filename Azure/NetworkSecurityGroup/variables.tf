variable "name" {
  description = "Specifies the name of the network security group."
  type        = string
}

variable "location" {
  description = "The name of the resource group in which to create the network security group."
  type        = string
}

variable "resources_group_name" {
  description = "Specifies the supported Azure location where the resource exists. "
  type        = string
}

variable "security_rule_block" {
  description = "List of objects representing security rules."
  type        = set(object({
    name                                       = string
    description                                = optional(string)
    protocol                                   = string
    source_port_range                          = optional(string)
    source_port_ranges                         = optional(set(number))
    destination_port_range                     = optional(string)
    destination_port_ranges                    = optional(set(string))
    source_address_prefix                      = optional(string)
    source_address_prefixes                    = optional(set(string))
    source_application_security_group_ids      = optional(set(string))
    destination_address_prefix                 = optional(string)
    destination_address_prefixes               = optional(set(string))
    destination_application_security_group_ids = optional(set(string))
    access                                     = string
    priority                                   = number
    direction                                  = string
  }))
  default = []
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