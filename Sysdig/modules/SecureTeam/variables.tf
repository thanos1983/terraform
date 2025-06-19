variable "name" {
  description = "The name of the Secure Team."
  type        = string
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

variable "use_sysdig_capture" {
  description = "Defines if the team is able to create Sysdig Capture files."
  type        = bool
  default     = true
}

variable "can_use_agent_cli" {
  description = "Enable this option to give this team access to Using the Agent Console."
  type        = bool
  default     = true
}

variable "can_use_rapid_response" {
  description = "Enable this option to give this Secure team access to Rapid Response."
  type        = bool
  default     = false
}

variable "default_team" {
  description = "Defines if the team is the default one."
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

variable "zone_ids" {
  description = "List of zone IDs attached to the team."
  type = list(string)
  default     = null
}

variable "all_zones" {
  description = "Attach all zones to the team."
  type        = bool
  default     = false
}