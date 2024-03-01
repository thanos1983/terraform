variable "application_id" {
  description = "The resource ID of the application for which this password should be created."
  type        = string
}

variable "display_name" {
  description = "A display name for the password. Changing this field forces a new resource to be created."
  type        = string
  default     = null
}

variable "end_date" {
  description = "Specifies the supported Azure location where the Public IP should exist."
  type        = string
  default     = null
}

variable "end_date_relative" {
  description = "A relative duration for which the password is valid until, for example 240h (10 days) or 2400h30m."
  type        = string
  default     = null
}

variable "rotate_when_changed" {
  description = "A map of arbitrary key/value pairs that will force recreation of the password when they change, enabling password rotation based on external conditions such as a rotating timestamp."
  type        = map(any)
  default     = null
}

variable "start_date" {
  description = "The start date from which the password is valid, formatted as an RFC3339 date string (e.g. 2018-01-01T01:02:03Z)."
  type        = string
  default     = null
}

variable "key_vault_id" {
  description = "The key vault ID for the vault."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}