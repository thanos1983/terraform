variable "name" {
  description = "The name of the Silence Rule."
  type        = string
}

variable "enabled" {
  description = "Whether to enable the Silence Rule."
  type        = bool
  default     = true
}

variable "start_ts" {
  description = "Specifies the type of the runtime policy."
  type        = string
}

variable "runbook" {
  description = "Customer provided url that provides a runbook for a given policy."
  type        = string
  default     = null
}

variable "scope" {
  description = "The application scope for the policy."
  type        = string
  default     = null
}

variable "actions_block" {
  description = "The actions block is optional and supports the following parameters."
  type = object({
    container = optional(string)
    capture_block = optional(object({
      seconds_before_event = number
      seconds_after_event  = number
      name                 = string
      filter = optional(string)
      bucket_name = optional(string)
      folder = optional(string)
    }), null)
  })
  default = null
}

variable "rules_blocks" {
  description = "The rules block can be repeated for each rule in the policy and supports."
  type = list(object({
    name = string
    enabled = optional(bool)
  }))
  default = []
}

variable "notification_channels" {
  description = "IDs of the notification channels to send alerts to when the policy is fired."
  type = list(string)
  default = []
}