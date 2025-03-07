variable "name" {
  description = "The name of the alert rule. It must be unique."
  type        = string
}

variable "description" {
  description = "The description of Monitor alert."
  type        = string
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
    main_threshold = optional(bool, true)
    warning_threshold = optional(bool, false)
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

variable "time_aggregation" {
  description = "Time aggregation function for data."
  type        = string
}

variable "group_aggregation" {
  description = "Group aggregation function for data."
  type        = string
}

variable "operator" {
  description = "Operator for the condition to alert on."
  type        = string
}

variable "threshold" {
  description = "Below of this percentage of downtime the alert will be triggered."
  type        = number
  default     = 100
}

variable "warning_threshold" {
  description = "Warning threshold used together with op to trigger the alert if crossed."
  type        = number
  default     = null
}

variable "shorter_time_range_seconds" {
  description = "Time range for which data is compared to a longer, previous period."
  type        = number
}

variable "longer_time_range_seconds" {
  description = "Time range for which data will be used as baseline for comparisons with data in the time range defined in shorter_time_range_seconds."
  type        = number
}

variable "unreported_alert_notifications_retention_seconds" {
  description = "Period after which any alerts triggered for entities (such as containers or hosts) that are no longer reporting data will be automatically marked as 'deactivated'."
  type        = number
  default     = null
}
