variable "rfc3339" {
  description = "Base timestamp in RFC3339 format (see RFC3339 time string e.g., YYYY-MM-DDTHH:MM:SSZ)."
  type        = string
  default     = null
}

variable "triggers" {
  description = "Arbitrary map of values that, when changed, will trigger a new base timestamp value to be saved."
  type = map(string)
  default     = null
}