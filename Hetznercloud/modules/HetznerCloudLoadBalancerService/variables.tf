variable "load_balancer_id" {
  description = "ID of the load balancer this service belongs to."
  type        = string
}

variable "protocol" {
  description = "Protocol of the service. http, https or tcp"
  type        = string
  default     = null
}

variable "listen_port" {
  description = "Port the service listen on, required if protocol is tcp."
  type        = number
  default     = null
}

variable "destination_port" {
  description = "Port the service connects to the targets on, required if protocol is tcp."
  type        = number
  default     = null
}

variable "proxyprotocol" {
  description = "Enable proxyprotocol."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.proxyprotocol)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "http_block" {
  description = "HTTP configuration when protocol is http or https."
  type = object({
    sticky_sessions = optional(bool)
    cookie_name = optional(string)
    cookie_lifetime = optional(number)
    certificates = optional(list(string))
    redirect_http = optional(bool)
  })
  default = null
}

variable "health_check_block" {
  description = "Health Check configuration when protocol is http or https."
  type = object({
    protocol = string
    port     = number
    interval = number
    timeout  = number
    retries = optional(number)
    http_block = optional(object({
      domain = optional(string)
      path = optional(string)
      response = optional(string)
      tls = optional(bool)
      status_codes = optional(list(string))
    }))
  })
  default = null
}
