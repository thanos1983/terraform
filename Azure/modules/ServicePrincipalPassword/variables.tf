variable "display_name" {
  description = "A display name for the password."
  type        = string
  default     = null
}

variable "end_date" {
  description = "The end date until which the password is valid, formatted as an RFC3339 date string (e.g. 2018-01-01T01:02:03Z)."
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
  type = map(any)
  default     = null
}

variable "service_principal_id" {
  description = "The ID of the service principal for which this password should be created."
  type        = string
}

variable "start_date" {
  description = "The start date from which the password is valid, formatted as an RFC3339 date string (e.g. 2018-01-01T01:02:03Z)."
  type        = string
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read = optional(number, 5)
    delete = optional(number, 30)
  })
  default = null
}