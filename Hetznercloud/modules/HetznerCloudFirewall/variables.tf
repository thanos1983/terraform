variable "name" {
  description = "Name of the Firewall."
  type        = string
  default     = null
}

variable "labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type        = map(any)
  default     = null
}

variable "rule_blocks" {
  description = "Configuration of one or more Rule(s) from this Firewall."
  type = list(object({
    direction       = string
    protocol        = string
    port            = string
    source_ips      = list(string)
    destination_ips = list(string)
  }))
  default = []
}

variable "apply_to_block" {
  description = "Resources the firewall should be assigned to."
  type = object({
    label_selector = optional(string)
    server         = optional(string)
  })
  default = null
}