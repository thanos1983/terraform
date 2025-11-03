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

variable "trigger_dependency_block" {
  description = "One or more trigger_dependency block as defined below."
  type = set(object({
    offset       = optional(string)
    size         = optional(string)
    trigger_name = optional(string)
  }))
  default = []
}

variable "start_time" {
  description = "The time the Schedule Trigger will start."
  type        = string
  default     = null
}

variable "end_time" {
  description = "The time the Schedule Trigger will end."
  type        = string
  default     = null
}

variable "max_concurrency" {
  description = "The time the Schedule Trigger should end."
  type        = number
  validation {
    condition     = var.max_concurrency >= 1 && var.max_concurrency <= 50
    error_message = "Accepted values: 1-50."
  }
  default = 50
}

variable "retry_block" {
  description = "A retry block."
  type = object({
    count    = string
    interval = optional(number, 30)
  })
  default = null
}

variable "interval" {
  description = "The interval for how often the trigger occurs. This defaults to 5."
  type        = number
  default     = 15
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

variable "additional_properties" {
  description = "A map of additional properties to associate with the Data Factory Tumbling Window Trigger."
  type        = map(any)
  default     = null
}

variable "pipeline_block" {
  description = "The pipeline block."
  type = object({
    name       = string
    parameters = optional(map(string))
  })
  default = null
}

variable "annotations" {
  description = "List of tags that can be used for describing the Data Factory Schedule Trigger."
  type        = set(any)
  default     = null
}

variable "delay" {
  description = "Specifies how long the trigger waits before triggering new run. formatted as an D.HH:MM:SS."
  type        = string
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
