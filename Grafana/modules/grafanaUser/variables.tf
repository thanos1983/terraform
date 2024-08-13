variable "email" {
  description = "The email address of the Grafana user."
  type        = string
}

variable "password" {
  description = "The password of the Grafana user."
  type        = string
}

variable "is_admin" {
  description = "Whether to make user an admin."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.is_admin)))
    error_message = "Possible values can be \"true\" or \"false\"."
  }
  default = false
}

variable "login" {
  description = "The username of the Grafana user."
  type        = string
  default     = null
}

variable "name" {
  description = "The name of the Grafana user."
  type        = string
  default     = null
}