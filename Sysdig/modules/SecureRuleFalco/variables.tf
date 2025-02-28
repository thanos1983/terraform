variable "name" {
  description = "The name of the Secure rule."
  type        = string
}

variable "description" {
  description = "The description of Secure rule."
  type        = string
  default     = null
}

variable "tags" {
  description = "A list of tags for this rule."
  type = list(string)
  default = []
}

variable "condition" {
  description = "A Falco condition is simply a Boolean predicate on Sysdig events expressed using the Sysdig filter syntax and macro terms."
  type        = string
}

variable "output" {
  description = "Add additional information to each Falco notification's output."
  type        = string
  default     = null
}

variable "priority" {
  description = "The priority of the Falco rule."
  type        = string
  validation {
    condition = contains([
      "emergency", "alert", "critical", "error", "warning", "notice", "info", "debug"
    ], lower(var.priority))
    error_message = "Possible values can be \"emergency\", \"alert\", \"critical\", \"error\", \"warning\", \"notice\", \"info\" or \"debug\"."
  }
  default = "warning"
}

variable "event_source" {
  description = "The source of the event."
  type        = string
  default     = null
}

variable "exceptions_blocks" {
  description = "The exceptions key is a list of identifier plus list of tuples of filtercheck fields."
  type = list(object({
    name   = string
    fields = optional(list(string))
    comps = optional(list(string))
    values = string
  }))
  default = []
}

variable "append" {
  description = "This indicates that the rule being created appends the condition to an existing Sysdig-provided rule."
  type        = bool
  default     = false
}

variable "minimum_engine_version" {
  description = "This is used to indicate that the rule requires a minimum engine version."
  type        = string
  default     = null
}
