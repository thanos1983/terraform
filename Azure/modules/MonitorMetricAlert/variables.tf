variable "name" {
  description = "Specifies the name of the network security group."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "scopes" {
  description = "A list of resource IDs which will be the target of alert processing rule."
  type        = list(string)
}

variable "criteria_blocks" {
  description = "One or more (static) criteria blocks as defined below."
  type = list(object({
    metric_namespace = string
    metric_name      = string
    aggregation      = string
    operator         = string
    threshold        = string
    dimension_blocks = optional(list(object({
      name     = string
      operator = string
      values   = list(string)
    })), [])
    skip_metric_validation = optional(bool)
  }))
  default = []
}

variable "dynamic_criteria_block" {
  description = "A dynamic_criteria block as defined below."
  type = object({
    metric_namespace  = string
    metric_name       = string
    aggregation       = string
    operator          = string
    alert_sensitivity = string
    dimension_blocks = optional(list(object({
      name     = string
      operator = string
      values   = list(string)
    })), [])
    evaluation_total_count   = optional(number)
    evaluation_failure_count = optional(number)
    ignore_data_before       = optional(string)
    skip_metric_validation   = optional(string)
  })
  default = null
}

variable "application_insights_web_test_location_availability_criteria_block" {
  description = "A application_insights_web_test_location_availability_criteria block as defined below."
  type = object({
    web_test_id           = string
    component_id          = string
    failed_location_count = number
  })
  default = null
}

variable "action_blocks" {
  description = "One or more action blocks as defined below."
  type = list(object({
    action_group_id    = string
    webhook_properties = optional(map(string))
  }))
  default = []
}

variable "enabled" {
  description = "Should the Alert Processing Rule be enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "auto_mitigate" {
  description = "Should the alerts in this Metric Alert be auto resolved?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.auto_mitigate)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "description" {
  description = "Specifies a description for the Alert Processing Rule."
  type        = string
  default     = null
}

variable "frequency" {
  description = "The evaluation frequency of this Metric Alert, represented in ISO 8601 duration format."
  type        = string
  validation {
    condition     = contains(["PT1M", "PT5M", "PT15M", "PT30M", "PT1H"], upper(var.frequency))
    error_message = "Possible values can be \"PT1M\", \"PT5M\", \"PT15M\", \"PT30M\" or \"PT1H\"."
  }
  default = "PT1M"
}

variable "severity" {
  description = "The severity of this Metric Alert."
  type        = number
  validation {
    condition     = contains(["0", "1", "2", "3", "4"], tostring(var.severity))
    error_message = "Possible values can be \"0\", \"1\", \"2\", \"3\" or \"4\" number."
  }
  default = 3
}

variable "target_resource_type" {
  description = "The resource type (e.g. Microsoft.Compute/virtualMachines) of the target resource."
  type        = string
  default     = null
}

variable "target_resource_location" {
  description = "The location of the target resource."
  type        = string
  default     = null
}

variable "window_size" {
  description = "The period of time that is used to monitor alert activity, represented in ISO 8601 duration format."
  type        = string
  validation {
    condition     = contains(["PT1M", "PT5M", "PT15M", "PT30M", "PT1H", "PT6H", "PT12H", "P1D"], upper(var.window_size))
    error_message = "Possible values can be \"PT1M\", \"PT5M\", \"PT15M\", \"PT30M\", \"PT1H\", \"PT6H\", \"PT12H\" or \"P1D\"."
  }
  default = "PT5M"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
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
