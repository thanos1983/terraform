variable "name" {
  description = "Specifies the name of the NAT Gateway."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the name of the Resource Group in which the NAT Gateway should exist."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the NAT Gateway should exist."
  type        = string
}

variable "idle_timeout_in_minutes" {
  description = "The idle timeout which should be used in minutes."
  type        = number
  default     = 4
}

variable "sku_name" {
  description = "The SKU which should be used."
  type        = string
  default     = "Standard"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}

variable "zones" {
  description = "A list of Availability Zones in which this NAT Gateway should be located."
  type        = list(string)
  default     = []
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}
