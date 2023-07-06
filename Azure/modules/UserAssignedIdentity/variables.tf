variable "name" {
  description = "Specifies the name of this User Assigned Identity."
  type        = string
}

variable "location" {
  description = "The Azure Region where the User Assigned Identity should exist."
  type        = string
}

variable "resource_group" {
  description = "Specifies the name of the Resource Group within which this User Assigned Identity should exist."
  type        = string
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the User Assigned Identity."
  type        = map(any)
  default     = null
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