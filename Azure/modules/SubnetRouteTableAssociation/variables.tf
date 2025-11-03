variable "route_table_id" {
  description = "The ID of the Route Table which should be associated with the Subnet."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the Subnet."
  type        = string
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
