variable "name" {
  description = "Name of the API Token."
  type        = string
}

variable "policies_blocks" {
  description = " List of access policies assigned to the token."
  type = list(object({
    effect = string
    permission_groups_blocks = list(object({
      id = string
      meta_block = optional(object({
        key = optional(string)
        value = optional(string)
      }))
    }))
    resources = map(any)
  }))
}

variable "condition_block" {
  description = "Conditions under which the token should be considered valid."
  type = object({
    request_ip_block = optional(object({
      in = optional(set(string))
      not_in = optional(set(string))
    }))
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
  default     = null
}
