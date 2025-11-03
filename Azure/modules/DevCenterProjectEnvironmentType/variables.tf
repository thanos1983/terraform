variable "name" {
  description = "Specifies the name of this Dev Center."
  type        = string
}

variable "dev_center_id" {
  description = "The ID of the associated Dev Center."
  type        = string
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Dev Center."
  type        = map(any)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 30)
    delete = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
  })
  default = null
}
