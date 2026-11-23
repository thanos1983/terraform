variable "name" {
  description = "The name which should be used for this Subnet Service Endpoint Storage Policy."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Subnet Service Endpoint Storage Policy should exist."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Subnet Service Endpoint Storage Policy should exist."
  type        = string
}

variable "definition_block" {
  description = "A definition block as defined below."
  type = object({
    name              = string
    service           = optional(string)
    service_resources = list(string)
    description       = optional(string)
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the Subscription."
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