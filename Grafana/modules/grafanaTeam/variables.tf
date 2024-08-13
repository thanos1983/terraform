variable "name" {
  description = "The display name for the Grafana team created."
  type        = string
}

variable "email" {
  description = "An email address for the team."
  type        = string
  default     = null
}

variable "ignore_externally_synced_members" {
  description = "Ignores team members that have been added to team by Team Sync."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.ignore_externally_synced_members)))
    error_message = "Possible values can be \"true\" or \"false\"."
  }
  default = true
}

variable "members" {
  description = "A set of email addresses corresponding to users who should be given membership to the team."
  type = set(string)
  default     = null
}

variable "org_id" {
  description = "The Organization ID. If not set, the Org ID defined in the provider block will be used."
  type        = string
  default     = null
}

variable "preferences_block" {
  description = "Preference block as defined below."
  type = object({
    home_dashboard_uid = optional(string)
    theme = optional(string)
    timezone = optional(string)
    week_start = optional(string)
  })
  default = null
}

variable "team_sync_block" {
  description = "Sync external auth provider groups with this Grafana team. Only available in the Grafana Enterprise."
  type = object({
    group = optional(set(string))
  })
  default = null
}