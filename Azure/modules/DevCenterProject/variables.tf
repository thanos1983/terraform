variable "dev_center_id" {
  description = "Resource Id of an associated DevCenter."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Dev Center Project should exist."
  type        = string
}

variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the name of the Resource Group within which this Dev Center Project should exist."
  type        = string
}

variable "description" {
  description = "Description of the project. Changing this forces a new Dev Center Project to be created."
  type        = string
  default     = null
}

variable "maximum_dev_boxes_per_user" {
  description = "When specified, limits the maximum number of Dev Boxes a single user can create across all pools in the project."
  type        = number
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type = map(any)
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 30)
    read = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}