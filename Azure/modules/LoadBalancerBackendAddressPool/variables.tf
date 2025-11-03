variable "name" {
  description = "Specifies the name of the Load Balancer"
  type        = string
}

variable "loadbalancer_id" {
  description = "The ID of the Load Balancer in which to create the Backend Address Pool."
  type        = string
}

variable "synchronous_mode" {
  description = "The backend address synchronous mode for the Backend Address Pool."
  type        = string
  default     = null
}

variable "tunnel_interface_blocks" {
  description = "One or more tunnel_interface blocks as defined below."
  type = list(object({
    identifier = number
    type       = string
    protocol   = string
    port       = number
  }))
  default = []
}

variable "virtual_network_id" {
  description = "The ID of the Virtual Network within which the Backend Address Pool should exist."
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
