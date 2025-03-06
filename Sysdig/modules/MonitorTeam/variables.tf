variable "name" {
  description = "The name of the Monitor Team."
  type        = string
}

variable "entrypoint_block" {
  description = "Main entry point for the current team in the product."
  type = object({
    type = string
    selection = optional(string)
  })
}

variable "description" {
  description = "A description of the team."
  type        = string
  default     = null
}

variable "theme" {
  description = "Colour of the team."
  type        = string
  default     = "#73A1F7"
}

variable "scope_by" {
  description = "Scope for the team."
  type        = string
  default     = "container"
}

variable "filter" {
  description = "If the team can only see some resources, write down a filter of such resources."
  type        = string
  default     = null
}

variable "can_use_sysdig_capture" {
  description = "List of notification channels that will be used to notify when the Silence Rule starts and end."
  type        = bool
  default     = true
}

variable "can_see_infrastructure_events" {
  description = "TODO"
  type        = bool
  default     = false
}

variable "can_use_aws_data" {
  description = "TODO"
  type        = bool
  default     = false
}

variable "user_roles_blocks" {
  description = "Multiple user roles can be specified."
  type = list(object({
    email = string
    role = optional(string)
  }))
  default = []
}

variable "default_team" {
  description = "Mark team as default team."
  type        = bool
  default     = false
}

variable "enable_ibm_platform_metrics" {
  description = "Enable platform metrics on IBM Cloud Monitoring."
  type        = bool
  default     = false
}

variable "ibm_platform_metrics" {
  description = "Define platform metrics on IBM Cloud Monitoring."
  type        = string
  default     = null
}
