variable "rfc3339" {
  description = "Base timestamp in RFC3339 format (see RFC3339 time string e.g., YYYY-MM-DDTHH:MM:SSZ)."
  type        = string
  default     = null
}

variable "rotation_days" {
  description = "Number of days to add to the base timestamp to configure the rotation timestamp."
  type        = number
  default     = null
}

variable "rotation_hours" {
  description = "Number of hours to add to the base timestamp to configure the rotation timestamp."
  type        = number
  default     = null
}

variable "rotation_minutes" {
  description = "Number of minutes to add to the base timestamp to configure the rotation timestamp."
  type        = number
  default     = null
}

variable "rotation_months" {
  description = "Number of months to add to the base timestamp to configure the rotation timestamp."
  type        = number
  default     = null
}

variable "rotation_rfc3339" {
  description = "Configure the rotation timestamp with an RFC3339 format of the offset timestamp."
  type        = string
  default     = null
}

variable "rotation_years" {
  description = "Number of years to add to the base timestamp to configure the rotation timestamp. When the current time has passed the rotation timestamp, the resource will trigger recreation."
  type        = number
  default     = null
}

variable "triggers" {
  description = "Arbitrary map of values that, when changed, will trigger a new base timestamp value to be saved."
  type        = map(string)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}