variable "name" {
  description = "Specifies the name of the Custom Provider."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Custom Provider."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "resource_type_blocks" {
  description = "Any number of resource_type block as defined below."
  type = list(object({
    name         = string
    endpoint     = string
    routing_type = optional(string)
  }))
  default = []
}

variable "action_blocks" {
  description = "Any number of action block as defined below."
  type = list(object({
    name     = string
    endpoint = string
  }))
  default = []
}

variable "validation_blocks" {
  description = "Any number of validation block as defined below."
  type = list(object({
    specification = string
  }))
  default = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 20)
    read   = optional(number, 5)
    update = optional(number, 20)
    delete = optional(number, 5)
  })
  default = null
}
