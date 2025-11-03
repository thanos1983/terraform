variable "name" {
  description = "Specifies the name of the network security group."
  type        = string
}

variable "target_resource_id" {
  description = "The ID of an existing Resource on which to configure Diagnostic Settings."
  type        = string
}

variable "eventhub_name" {
  description = "Specifies the name of the Event Hub where Diagnostics Data should be sent."
  type        = string
  default     = null
}

variable "eventhub_authorization_rule_id" {
  description = "Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data."
  type        = string
  default     = null
}

variable "enabled_log_blocks" {
  description = "An enabled_log block supports the following."
  type = list(object({
    category       = optional(string)
    category_group = optional(string)
  }))
  default = null
}

variable "log_analytics_workspace_id" {
  description = "Specifies the ID of a Log Analytics Workspace where Diagnostics Data should be sent."
  type        = string
  default     = null
}

variable "enabled_metric_blocks" {
  description = "A metric block supports the following."
  type = list(object({
    category = string
  }))
  default = null
}

variable "storage_account_id" {
  description = "The ID of the Storage Account where logs should be sent. "
  type        = string
  default     = null
}

variable "log_analytics_destination_type" {
  description = "Possible values are AzureDiagnostics and Dedicated."
  type        = string
  validation {
    condition = contains([
      "AzureDiagnostics", "Dedicated"
    ], title(var.log_analytics_destination_type))
    error_message = "Possible values can only be \"AzureDiagnostics\" or \"Dedicated\"."
  }
  default = "Dedicated"
}

variable "partner_solution_id" {
  description = "The ID of the market partner solution where Diagnostics Data should be sent."
  type        = string
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}
