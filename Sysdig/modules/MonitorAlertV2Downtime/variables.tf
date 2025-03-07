variable "name" {
  description = "The name of the alert rule. It must be unique."
  type        = string
}

variable "description" {
  description = "The description of Monitor alert."
  type        = string
  default     = null
}

variable "range_seconds" {
  description = "The rolling time aggregation period in which the relevant metric data is evaluated."
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

variable "capture_block" {
  description = "Enables the creation of a capture file of the syscalls during the event."
  type = object({
    filename = string
    duration_seconds = optional(number, 15)
    storage = optional(string, null)
    filter = optional(string, null)
    enabled = optional(bool, true)
  })
  default = null
}

variable "scope_blocks" {
  description = "Part of the infrastructure where the alert is valid."
  type = list(object({
    label    = string
    operator = string
    values = list(string)
  }))
  default = []
}

variable "group_by" {
  description = "List of segments to trigger a separate alert on."
  type = list(string)
  default = []
}

variable "metric" {
  description = "Metric the alert will act upon."
  type        = string
}

variable "threshold" {
  description = "Below of this percentage of downtime the alert will be triggered."
  type        = number
}

variable "unreported_alert_notifications_retention_seconds" {
  description = "Period after which any alerts triggered for entities (such as containers or hosts) that are no longer reporting data will be automatically marked as 'deactivated'."
  type        = number
  default     = null
}
