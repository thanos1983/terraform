variable "name" {
  description = "Specifies the name of the Logic App Changing this forces a new resource to be created. "
  type        = string
}

variable "logic_app_id" {
  description = "Specifies the ID of the Logic App Workflow."
  type        = string
}

variable "frequency" {
  description = "Specifies the Frequency at which this Trigger should be run."
  type        = string
}

variable "interval" {
  description = "Specifies interval used for the Frequency, for example a value of 4 for interval and hour for frequency would run the Trigger every 4 hours."
  type        = string
}

variable "start_time" {
  description = "Specifies the Relative Path used for this Request."
  type        = string
  default     = null
}

variable "time_zone" {
  description = "Specifies the Relative Path used for this Request."
  type        = string
  default     = null
}

variable "schedule_block" {
  description = "Specifies the Relative Path used for this Request."
  type        = object({
    at_these_minutes = optional(list(string))
    at_these_hours   = optional(list(string))
    on_these_days    = optional(list(string))
  })
  default = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    update = optional(number, 30)
    read   = optional(number, 5)
    delete = optional(number, 30)
  })
  default = null
}