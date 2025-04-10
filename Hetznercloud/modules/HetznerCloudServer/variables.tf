variable "name" {
  description = "Name of the server to create (must be unique per project and a valid hostname as per RFC 1123)."
  type        = string
}

variable "server_type" {
  description = "Name of the server type this server should be created with."
  type        = string
}

variable "image" {
  description = "Name or ID of the image the server is created from."
  type        = string
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
