variable "type" {
  description = "Type of the target. Possible values server, label_selector, ip."
  type        = string
}

variable "load_balancer_id" {
  description = "ID of the Load Balancer to which the target gets attached."
  type        = string
}

variable "server_id" {
  description = "ID of the server which should be a target for this Load Balancer."
  type        = number
  default     = null
}

variable "label_selector" {
  description = "Label Selector selecting targets for this Load Balancer."
  type        = string
  default     = null
}

variable "ip" {
  description = "IP address for an IP Target. Required if type is ip."
  type        = bool
  default     = null
}

variable "use_private_ip" {
  description = "Use the private IP to connect to Load Balancer targets."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.use_private_ip)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}
