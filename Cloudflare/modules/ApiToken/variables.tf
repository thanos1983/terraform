variable "name" {
  description = "Name of the API Token."
  type        = string
}

variable "policy_blocks" {
  description = "Permissions policy."
  type        = list(object({
    permission_groups = set(string)
    resources         = map(string)
    effect            = optional(bool)
  }))
}

variable "condition_block" {
  description = "Conditions under which the token should be considered valid."
  type        = object({
    request_ip_block = optional(object({
      in     = optional(set(string))
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