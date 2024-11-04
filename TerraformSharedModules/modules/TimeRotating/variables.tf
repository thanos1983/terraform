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
  type        = number
  default     = null
}

variable "rotation_years" {
  description = "Number of years to add to the base timestamp to configure the rotation timestamp."
  type        = number
  default     = null
}

variable "triggers" {
  description = "A map of arbitrary strings that, when changed, will force the null resource to be replaced, re-running any associated provisioners."
  type = map(string)
  default     = null
}