variable "location" {
  description = "The Azure Region where the Resource Group should exist."
  type        = string
}

variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number)
    read   = optional(number)
    update = optional(number)
    delete = optional(number)
  })
  default = {
    create = null
    read   = null
    update = null
    delete = null
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}
