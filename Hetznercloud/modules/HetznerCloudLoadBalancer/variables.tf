variable "name" {
  description = "Name of the Load Balancer."
  type        = string
}

variable "load_balancer_type" {
  description = "Type of the Load Balancer."
  type        = string
}

variable "location" {
  description = "The location name of the Load Balancer."
  type        = string
  default     = null
}

variable "network_zone" {
  description = "The Network Zone of the Load Balancer."
  type        = string
  default     = null
}

variable "algorithm_block" {
  description = "Configuration of the algorithm the Load Balancer use."
  type = object({
    type = string
  })
  default = null
}

variable "labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type = map(any)
  default     = null
}

variable "delete_protection" {
  description = "Enable or disable delete protection."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.delete_protection)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}
