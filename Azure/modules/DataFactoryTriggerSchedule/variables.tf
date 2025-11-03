variable "name" {
  description = "Specifies the name of the Data Factory Schedule Trigger."
  type        = string
}

variable "data_factory_id" {
  description = "The Data Factory ID in which to associate the Linked Service with."
  type        = string
}

variable "description" {
  description = "The Schedule Trigger's description."
  type        = string
  default     = null
}

variable "schedule_block" {
  description = "A schedule block as defined below, which further specifies the recurrence schedule for the trigger."
  type = map(object({
    days_of_month = optional(string)
    days_of_week  = optional(string)
    hours         = optional(string)
    minutes       = optional(string)
    monthlies = optional(set(object({
      weekday = string
      week    = optional(string)
    })))
  }))
  default = {}
}

variable "start_time" {
  description = "The time the Schedule Trigger will start. This defaults to the current time."
  type        = string
  default     = null
}

variable "time_zone" {
  description = "The timezone of the start/end time."
  type        = string
  default     = null
}

variable "end_time" {
  description = "The time the Schedule Trigger should end."
  type        = string
  default     = null
}

variable "interval" {
  description = "The interval for how often the trigger occurs. This defaults to 1."
  type        = number
  default     = 1
}

variable "frequency" {
  description = "The trigger frequency. Valid values include Minute, Hour, Day, Week, Month. Defaults to Minute."
  type        = string
  validation {
    condition = contains([
      "Minute", "Hour", "Day", "Week", "Month"
    ], title(var.frequency))
    error_message = "Trigger frequency must be valid value. Valid values are: \"Minute\", \"Hour\", \"Day\", \"Week\" or \"Month\". Default \"Minute\"."
  }
  default = "Minute"
}

variable "activated" {
  description = "Specifies if the Data Factory Schedule Trigger is activated. Defaults to true."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.activated)))
    error_message = "Factory Schedule Trigger is activated. Defaults to true. Valid value can only be \"true\" or \"false\"."
  }
  default = true
}

variable "pipeline_block" {
  description = "The pipeline block."
  type = object({
    name       = string
    parameters = optional(map(string))
  })
  default = null
}

variable "pipeline_name" {
  description = "The Data Factory Pipeline name that the trigger will act on."
  type        = string
  default     = null
}

variable "pipeline_parameters" {
  description = "The pipeline parameters that the trigger will act upon."
  type        = map(any)
  default     = null
}

variable "annotations" {
  description = "List of tags that can be used for describing the Data Factory Schedule Trigger."
  type        = set(any)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}
