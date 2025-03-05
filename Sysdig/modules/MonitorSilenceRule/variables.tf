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
  description = "Unix timestamp, in milliseconds, when the Silence Rule starts."
  type        = string
}

variable "duration_seconds" {
  description = "Duration of the Silence Rule, in seconds."
  type        = string
}

variable "scope" {
  description = "Part of the infrastructure the Silence Rule will be applied to."
  type        = string
  default     = null
}

variable "alert_ids" {
  description = "List of alerts the Silence Rule will be applied to."
  type = list(string)
  default = []
}

variable "notification_channel_ids" {
  description = "List of notification channels that will be used to notify when the Silence Rule starts and end."
  type = list(string)
  default = []
}
