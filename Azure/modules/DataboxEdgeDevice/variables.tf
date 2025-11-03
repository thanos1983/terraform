variable "name" {
  description = "The name which should be used for this Databox Edge Device."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Databox Edge Device should exist."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Databox Edge Device should exist."
  type        = string
}

variable "sku_name" {
  description = "The sku_name is comprised of two segments separated by a hyphen (e.g. TEA_1Node_UPS_Heater-Standard)."
  type        = string
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Databox Edge Device."
  type        = map(any)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}
