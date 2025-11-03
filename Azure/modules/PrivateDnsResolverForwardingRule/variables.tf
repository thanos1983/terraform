variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "dns_forwarding_ruleset_id" {
  description = "Specifies the ID of the Private DNS Resolver Forwarding Ruleset."
  type        = string
}

variable "domain_name" {
  description = "Specifies the domain name for the Private DNS Resolver Forwarding Rule."
  type        = string
}

variable "target_dns_servers_block" {
  description = "DNS primary server IP and port address."
  type = list(object({
    ip_address = string
    port       = optional(number, 53)
  }))
}

variable "enabled" {
  description = "Specifies the state of the Private DNS Resolver Forwarding Rule."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enabled)))
    error_message = "Parameter must be \"true\" or \"false\"."
  }
  default = true
}

variable "metadata" {
  description = "Metadata attached to the Private DNS Resolver Forwarding Rule."
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
