variable "name" {
  description = "Specifies the name of the Probe."
  type        = string
}

variable "loadbalancer_id" {
  description = "The ID of the LoadBalancer in which to create the Probe."
  type        = string
}

variable "protocol" {
  description = "Specifies the supported Azure location where the Load Balancer resource should be created."
  type        = string
  validation {
    condition     = contains(["Http", "Https", "Tcp"], title(var.protocol))
    error_message = "Sku name must be \"Http\", \"Https\" or \"Tcp\"."
  }
  default = "Tcp"
}

variable "port" {
  description = "Specifies the Edge Zone within the Azure Region where this Load Balancer should exist."
  type        = number
}

variable "probe_threshold" {
  description = "The number of consecutive successful or failed probes that allow or deny traffic to this endpoint."
  type        = number
  default     = 1
}

variable "request_path" {
  description = "The URI used for requesting health status from the backend endpoint."
  type        = string
  default     = null
}

variable "interval_in_seconds" {
  description = "The interval, in seconds between probes to the backend endpoint for health status."
  type        = number
  default     = 15
}

variable "number_of_probes" {
  description = "The number of failed probe attempts after which the backend endpoint is removed from rotation."
  type        = number
  default     = 2
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
