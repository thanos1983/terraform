variable "load_balancer_id" {
  description = "ID of the Load Balancer."
  type        = string
}

variable "network_id" {
  description = "ID of the network which should be added to the Load Balancer."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "ID of the sub-network which should be added to the Load Balancer."
  type        = string
  default     = null
}

variable "ip" {
  description = "IP to request to be assigned to this Load Balancer."
  type        = string
  default     = null
}

variable "enable_public_interface" {
  description = " Enable or disable the Load Balancers public interface. "
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.enable_public_interface)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default     = true
}
