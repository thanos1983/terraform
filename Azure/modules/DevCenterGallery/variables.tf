variable "dev_center_id" {
  description = "Specifies the ID of the Dev Center within which this Dev Center Gallery should exist."
  type        = string
}

variable "shared_gallery_id" {
  description = "The ID of the Shared Gallery which should be connected to the Dev Center Gallery."
  type        = string
}

variable "name" {
  description = "Specifies the name of this Dev Center Gallery."
  type        = string
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
