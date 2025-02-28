variable "name" {
  description = "The name of the Secure rule. It must be unique."
  type        = string
}

variable "description" {
  description = "The description of Secure rule. By default is empty."
  type        = string
  default     = null
}

variable "tags" {
  description = "A list of tags for this rule."
  type = list(string)
  default = []
}

variable "block_inbound" {
  description = "Detect if there is an inbound connection."
  type        = bool
  default     = true
}

variable "block_outbound" {
  description = "Detect if there is an outbound connection."
  type        = bool
  default     = true
}

variable "tcp_block" {
  description = "Detect TCP Connections"
  type = object({
    matching = optional(bool)
    ports = list(number)
  })
  default = null
}

variable "udp_block" {
  description = "Detect UDP Connections"
  type = object({
    matching = optional(bool)
    ports = list(number)
  })
  default = null
}