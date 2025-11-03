variable "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of the Public IP which this NAT Gateway which should be connected to."
  type        = string
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    delete = optional(number, 30)
  })
  default = null
}
