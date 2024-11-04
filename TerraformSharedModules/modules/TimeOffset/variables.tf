variable "base_rfc3339" {
  description = "Base timestamp in RFC3339 format (see RFC3339 time string e.g., YYYY-MM-DDTHH:MM:SSZ)."
  type        = string
  default     = null
}

variable "offset_days" {
  description = "Number of days to offset the base timestamp."
  type        = number
  default     = null
}

variable "offset_hours" {
  description = "Number of hours to offset the base timestamp."
  type        = number
  default     = null
}

variable "offset_minutes" {
  description = "Number of minutes to offset the base timestamp."
  type        = number
  default     = null
}

variable "offset_months" {
  description = "Number of months to offset the base timestamp."
  type        = number
  default     = null
}

variable "offset_seconds" {
  description = "Number of seconds to offset the base timestamp."
  type        = number
  default     = null
}

variable "offset_years" {
  description = "Number of years to offset the base timestamp."
  type        = number
  default     = null
}

variable "triggers" {
  description = "Arbitrary map of values that, when changed, will trigger a new base timestamp value to be saved."
  type = map(string)
  default     = null
}