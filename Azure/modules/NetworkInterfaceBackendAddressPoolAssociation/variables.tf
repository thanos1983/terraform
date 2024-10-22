variable "network_interface_id" {
  description = "The ID of the Network Interface. Changing this forces a new resource to be created."
  type        = string
}

variable "ip_configuration_name" {
  description = "The Name of the IP Configuration within the Network Interface which should be connected to the Backend Address Pool."
  type        = string
}

variable "backend_address_pool_id" {
  description = "The ID of the Load Balancer Backend Address Pool which this Network Interface should be connected to."
  type        = string
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read = optional(number, 5)
    delete = optional(number, 30)
  })
  default = null
}