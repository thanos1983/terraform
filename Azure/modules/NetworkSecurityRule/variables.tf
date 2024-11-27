variable "name" {
  description = "Specifies the name of the network security group."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the supported Azure location where the resource exists. "
  type        = string
}

variable "network_security_group_name" {
  description = "The name of the Network Security Group that we want to attach the rule to."
  type        = string
}

variable "description" {
  description = "A description for this rule."
  type        = string
  default     = null
}

variable "protocol" {
  description = "Network protocol this rule applies to."
  type        = string
  validation {
    condition = contains([
      "Tcp", "Udp", "Icmp", "Esp", "Ah", "*"
    ], title(var.protocol))
    error_message = "Possible values can only be \"Tcp\", \"Udp\", \"Icmp\", \"Esp\", \"Ah\" or \"*\"."
  }
  default = "*"
}

variable "source_port_range" {
  description = "Source Port or Range. Integer or range between 0 and 65535 or * to match any."
  type        = string
  default     = null
}

variable "source_port_ranges" {
  description = "List of source ports or port ranges."
  type        = list(string)
  default     = []
}

variable "destination_port_range" {
  description = "Destination Port or Range. Integer or range between 0 and 65535 or * to match any."
  type        = string
  default     = null
}

variable "destination_port_ranges" {
  description = "List of destination ports or port ranges."
  type        = list(string)
  default     = []
}

variable "source_address_prefix" {
  description = "CIDR or source IP range or * to match any IP."
  type        = string
  default     = null
}

variable "source_address_prefixes" {
  description = "List of source address prefixes."
  type        = list(string)
  default     = []
}

variable "source_application_security_group_ids" {
  description = "A List of source Application Security Group IDs."
  type        = list(string)
  default     = []
}

variable "destination_address_prefix" {
  description = "CIDR or destination IP range or * to match any IP."
  type        = string
  default     = null
}

variable "destination_address_prefixes" {
  description = "List of destination address prefixes."
  type        = list(string)
  default     = []
}

variable "destination_application_security_group_ids" {
  description = "A List of destination Application Security Group IDs."
  type        = list(string)
  default     = []
}

variable "access" {
  description = "Specifies whether network traffic is allowed or denied."
  type        = string
  validation {
    condition = contains([
      "Allow", "Deny"
    ], title(var.access))
    error_message = "Possible values can only be \"Allow\" or \"Deny\"."
  }
  default = "Allow"
}

variable "priority" {
  description = "Specifies the priority of the rule."
  type        = number
  default     = 100
}

variable "direction" {
  description = "The direction specifies if rule will be evaluated on incoming or outgoing traffic."
  type        = string
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}