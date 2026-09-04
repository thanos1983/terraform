variable "add_action_group_ids" {
  description = "Specifies a list of Action Group IDs."
  type        = list(string)
}

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

variable "condition_block" {
  description = "A condition block as defined below."
  type = object({
    alert_context_block = optional(object({
      operator = string
      values   = list(string)
    }))
    alert_rule_id_block = optional(object({
      operator = string
      values   = list(string)
    }))
    alert_rule_name_block = optional(object({
      operator = string
      values   = list(string)
    }))
    description_block = optional(object({
      operator = string
      values   = list(string)
    }))
    monitor_condition_block = optional(object({
      operator = string
      values   = list(string)
    }))
    monitor_service_block = optional(object({
      operator = string
      values   = list(string)
    }))
    severity_block = optional(object({
      operator = string
      values   = list(string)
    }))
    signal_type_block = optional(object({
      operator = string
      values   = list(string)
    }))
    target_resource_block = optional(object({
      operator = string
      values   = list(string)
    }))
    target_resource_group_block = optional(object({
      operator = string
      values   = list(string)
    }))
    target_resource_type_block = optional(object({
      operator = string
      values   = list(string)
    }))
  })
  default = null
}

variable "description" {
  description = "Specifies a description for the Alert Processing Rule."
  type        = string
  default     = null
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

variable "schedule_block" {
  description = "A schedule block as defined below."
  type = object({
    effective_from  = optional(string)
    effective_until = optional(string)
    recurrence_block = optional(object({
      daily_block = optional(object({
        start_time = string
        end_time   = string
      }))
      weekly_block = optional(object({
        days_of_week = list(string)
        start_time   = optional(string)
        end_time     = optional(string)
      }))
      monthly_block = optional(object({
        days_of_month = number
        start_time    = optional(string)
        end_time      = optional(string)
      }))
    }))
    time_zone = optional(string)
  })
  default = null
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