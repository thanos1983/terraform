variable "type" {
  description = "Type of the Floating IP."
  type        = string
}

variable "name" {
  description = "Name of the Floating IP."
  type        = string
  default     = null
}

variable "server_id" {
  description = "Server to assign the Floating IP to."
  type        = number
  default     = null
}

variable "home_location" {
  description = "Name of home location (routing is optimized for that location)."
  type        = string
  default     = null
}

variable "description" {
  description = "Description of the Floating IP."
  type        = string
  default     = null
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
