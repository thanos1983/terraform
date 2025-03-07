variable "name" {
  description = "The name of the alert rule. It must be unique."
  type        = string
}

variable "description" {
  description = "The description of Monitor alert."
  type        = string
  default     = null
}

variable "duration_seconds" {
  description = "Specifies the amount of time, in seconds, that an alert condition must remain continuously true before the alert rule is triggered."
  type        = number
  default     = null
}

variable "group" {
  description = "Used to group alert rules in the UI."
  type        = string
  default     = null
}

variable "severity" {
  description = "Severity of the Monitor alert."
  type        = string
  validation {
    condition = contains(["high", "medium", "low", "info"], lower(var.severity))
    error_message = "Possible values can be \"high\", \"medium\", \"low\" or \"info\"."
  }
  default = "low"
}

variable "enabled" {
  description = "Boolean that defines if the alert is enabled or not."
  type        = bool
  default     = true
}

variable "notification_channels_blocks" {
  description = "List of notification channel configurations."
  type = list(object({
    id = number
    renotify_every_minutes = optional(number, 0)
    notify_on_resolve = optional(bool, true)
  }))
  default = []
}

variable "custom_notification_block" {
  description = "Allows to define a custom notification title, prepend and append text."
  type = object({
    subject = optional(string, null)
    prepend = optional(string, null)
    append = optional(string, null)
  })
  default = null
}

variable "link_blocks" {
  description = "List of links to add to notifications."
  type = list(object({
    type = string
    href = optional(string)
    id = optional(string)
  }))
  default = []
}

variable "labels" {
  description = "Map of labels to be attached to this alert."
  type = map(any)
  default = {}
}

variable "query" {
  description = "PromQL-based metric expression to alert on."
  type        = string
}

variable "keep_firing_for_minutes" {
  description = "Alert resolution delay before actually resolving an alert."
  type        = number
  default     = null
}
