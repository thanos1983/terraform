variable "name" {
  description = "Name of the API Token."
  type        = string
}

variable "policies" {
  description = "List of access policies assigned to the token."
  type = list(object({
    effect = string
    permission_groups = list(object({
      id = string
      meta = optional(object({
        key   = optional(string)
        value = optional(string)
      }))
    }))
    resources = map(any)
  }))
}

variable "condition" {
  description = "Client IP restrictions."
  type = object({
    request_ip = optional(object({
      in = optional(list(string))
      not_in = optional(list(string))
    }), null)
  })
  default = null
}

variable "expires_on" {
  description = "The expiration time on or after which the token MUST NOT be accepted for processing."
  type        = string
  default     = null
}

variable "not_before" {
  description = "The time before which the token MUST NOT be accepted for processing."
  type        = string
  default     = null
}

variable "status" {
  description = "Status of the token."
  type        = string
  validation {
    condition = contains(["active", "disabled", "expired"], lower(var.status))
    error_message = "Parameter must be 'active', 'disabled' or 'expired'."
  }
  default = "active"
}
