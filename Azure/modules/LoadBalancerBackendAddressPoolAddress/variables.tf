variable "backend_address_pool_id" {
  description = "The ID of the Backend Address Pool."
  type        = string
}

variable "ip_address" {
  description = "The Static IP Address which should be allocated to this Backend Address Pool."
  type        = string
  default     = null
}

variable "name" {
  description = "The name which should be used for this Backend Address Pool Address."
  type        = string
}

variable "virtual_network_id" {
  description = "The ID of the Virtual Network within which the Backend Address Pool should exist."
  type        = string
  default     = null
}

variable "backend_address_ip_configuration_id" {
  description = "The ip config ID of the regional load balancer that's added to the global load balancer's backend address pool."
  type        = string
  default     = null
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
