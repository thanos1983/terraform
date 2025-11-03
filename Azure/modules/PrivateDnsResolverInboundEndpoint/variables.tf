variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "private_dns_resolver_id" {
  description = "Specifies the ID of the Private DNS Resolver Inbound Endpoint."
  type        = string
}

variable "ip_configurations_block" {
  description = "IP configurations block"
  type = list(object({
    private_ip_allocation_method = optional(string)
    subnet_id                    = string
  }))
}

variable "location" {
  description = "Specifies the Azure Region where the Private DNS Resolver should exist."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
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
