variable "name" {
  description = "The name of the Secure policy."
  type        = string
}

variable "description" {
  description = "The description of Secure policy."
  type        = string
}

variable "severity" {
  description = "The severity of Secure policy."
  type        = number
  default     = 7
}

variable "enabled" {
  description = "Will secure process with this policy?"
  type        = bool
  default     = false
}

variable "type" {
  description = "Specifies the type of the runtime policy."
  type        = string
  validation {
    condition = contains([
      "falco", "list_matching", "k8s_audit", "aws_cloudtrail", "gcp_auditlog", "azure_platformlogs", "awscloudtrail",
      "okta", "github", "guardduty"
    ], lower(var.type))
    error_message = "Possible values can be \"falco\", \"list_matching\", \"k8s_audit\", \"aws_cloudtrail\", \"gcp_auditlog\", \"azure_platformlogs\", \"awscloudtrail\", \"okta\", \"github\" or \"guardduty\"."
  }
  default = "falco"
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

variable "actions_blocks" {
  description = "The actions block is optional and supports the following parameters."
  type = list(object({
    container = optional(string)
    capture_block = optional(object({
      seconds_before_event = number
      seconds_after_event  = number
      name                 = string
      filter = optional(string)
      bucket_name = optional(string)
      folder = optional(string)
    }), null)
  }))
  default = []
}

variable "rule_names" {
  description = "Array with the name of the rules to match."
  type = list(string)
  default = []
}

variable "notification_channels" {
  description = "IDs of the notification channels to send alerts to when the policy is fired."
  type = list(string)
  default = []
}