variable "application_id" {
  description = "The resource ID of the application registration."
  type        = string
}

variable "owner_object_id" {
  description = "The object ID of the owner to assign to the application, typically a user or service principal."
  type        = string
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 10)
    read   = optional(number, 5)
    delete = optional(number, 5)
  })
  default = null
}
