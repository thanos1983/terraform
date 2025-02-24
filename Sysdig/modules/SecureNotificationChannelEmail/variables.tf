variable "name" {
  description = "Specifies the name of the azure resource."
  type        = string
}

variable "recipients" {
  description = "List of recipients that will receive the message."
  type = list(string)
}

variable "enabled" {
  description = "If false, the channel will not emit notifications."
  type        = bool
  default     = true
}

variable "notify_when_ok" {
  description = "Send a new notification when the alert condition is no longer triggered."
  type        = bool
  default     = false
}

variable "notify_when_resolved" {
  description = "Send a new notification when the alert is manually acknowledged by a user."
  type        = bool
  default     = false
}

variable "send_test_notification" {
  description = "Send an initial test notification to check if the notification channel is working."
  type        = bool
  default     = false
}

variable "share_with_current_team" {
  description = "If set to true it will share notification channel only with current team (in which user is logged in)."
  type        = bool
  default     = false
}