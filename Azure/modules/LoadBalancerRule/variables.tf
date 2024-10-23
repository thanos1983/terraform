variable "name" {
  description = "Specifies the name of the Probe."
  type        = string
}

variable "loadbalancer_id" {
  description = "The ID of the LoadBalancer in which to create the Probe."
  type        = string
}

variable "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration to which the rule is associated."
  type        = string
}

variable "protocol" {
  description = "Specifies the supported Azure location where the Load Balancer resource should be created."
  type        = string
  validation {
    condition = contains(["Http", "Https", "Tcp"], title(var.protocol))
    error_message = "Sku name must be \"Http\", \"Https\" or \"Tcp\"."
  }
  default = "Tcp"
}

variable "frontend_port" {
  description = "The port for the external endpoint."
  type        = number
}

variable "backend_port" {
  description = "The port used for internal connections on the endpoint."
  type        = number
}

variable "backend_address_pool_ids" {
  description = "A list of reference to a Backend Address Pool over which this Load Balancing Rule operates."
  type = list(string)
  default = []
}

variable "probe_id" {
  description = "A reference to a Probe used by this Load Balancing Rule."
  type        = string
  default     = null
}

variable "enable_floating_ip" {
  description = "Are the Floating IPs enabled for this Load Balancer Rule?"
  type        = bool
  validation {
    condition = contains(["false", "true"], lower(tostring(var.enable_floating_ip)))
    error_message = "The boolean value can only be \"true\" or \"false\"."
  }
  default = false
}

variable "idle_timeout_in_minutes" {
  description = "Specifies the idle timeout in minutes for TCP connections."
  type        = number
  default     = 4
}

variable "load_distribution" {
  description = "Specifies the load balancing distribution type to be used by the Load Balancer."
  type        = string
  default     = "Default"
}

variable "disable_outbound_snat" {
  description = "Is snat enabled for this Load Balancer Rule?"
  type        = bool
  validation {
    condition = contains(["false", "true"], lower(tostring(var.disable_outbound_snat)))
    error_message = "The boolean value can only be \"true\" or \"false\"."
  }
  default = false
}

variable "enable_tcp_reset" {
  description = "Is TCP Reset enabled for this Load Balancer Rule?"
  type        = string
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}