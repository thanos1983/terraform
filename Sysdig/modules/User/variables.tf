variable "email" {
  description = "The email for the user to invite."
  type        = string
}

variable "system_role" {
  description = "The privileges for the user. It can be either 'ROLE_USER' or 'ROLE_CUSTOMER'."
  type        = string
  validation {
    condition = contains(["ROLE_USER", "ROLE_CUSTOMER"], upper(var.system_role))
    error_message = "Possible values can be \"ROLE_USER\" or \"ROLE_CUSTOMER\" boolean."
  }
  default = "ROLE_USER"
}

variable "first_name" {
  description = "The name of the user."
  type        = string
  default     = null
}

variable "last_name" {
  description = "The last name of the user."
  type        = string
  default     = null
}
