variable "name" {
  description = "The name of the Arc machine."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Arc Machine should exist."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Arc Machine should exist."
  type        = string
}

variable "kind" {
  description = "The kind of the Arc Machine."
  type        = string
  default     = null
}

variable "identity_block" {
  description = "An identity block as defined below."
  type = object({
    type = string
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the Arc Machine."
  type        = map(any)
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