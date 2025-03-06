variable "ip_range" {
  description = "The IP range to allow access to the Sysdig platform. Must be in CIDR notation."
  type        = string
}

variable "enabled" {
  description = "Specifies whether the IP range is enabled."
  type        = bool
}

variable "note" {
  description = "A note describing the allowed IP range."
  type        = string
  default     = null
}
