variable "location" {
  description = "The Azure Region where the Dev Center should exist."
  type        = string
}

variable "name" {
  description = "Specifies the name of this Dev Center."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the name of the Resource Group within which this Dev Center should exist."
  type        = string
}

variable "identity_block" {
  description = "An identity block as defined below."
  type = object({
    type = string
    identity_ids = optional(list(string))
  })
  default = {
    type = "SystemAssigned"
  }
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Dev Center."
  type = map(any)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 30)
    delete = optional(number, 30)
    read = optional(number, 5)
    update = optional(number, 30)
  })
  default = null
}