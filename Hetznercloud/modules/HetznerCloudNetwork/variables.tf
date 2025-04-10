variable "name" {
  description = "Name of the Network to create (must be unique per project)."
  type        = string
}

variable "ip_range" {
  description = "IP Range of the whole Network which must span all included subnets and route destinations."
  type        = string
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

variable "expose_routes_to_vswitch" {
  description = "Enable or disable exposing the routes to the vSwitch connection."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.expose_routes_to_vswitch)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}
