variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where this Public IP should exist."
  type        = string
}

variable "soa_record_block" {
  description = "An soa_record block."
  type = object({
    email         = string
    host_name     = string
    expire_time   = optional(number, 2419200)
    minimum_ttl   = optional(number, 10)
    refresh_time  = optional(number, 3600)
    retry_time    = optional(number, 300)
    serial_number = optional(number, 1)
    ttl           = optional(number, 3600)
    tags          = optional(map(any))
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
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
