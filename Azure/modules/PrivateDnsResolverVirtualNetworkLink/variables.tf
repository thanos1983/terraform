variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "dns_forwarding_ruleset_id" {
  description = "Specifies the ID of the Private DNS Resolver DNS Forwarding Ruleset."
  type        = string
}

variable "virtual_network_id" {
  description = "The ID of the Virtual Network that is linked to the Private DNS Resolver Virtual Network Link."
  type        = string
}

variable "metadata" {
  description = "Metadata attached to the Private DNS Resolver Virtual Network Link."
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
