variable "create_duration" {
  description = "Time duration to delay resource creation."
  type        = string
  default     = null
}

variable "destroy_duration" {
  description = "Time duration to delay resource creation."
  type        = string
  default     = null
}

variable "triggers" {
  description = "A map of arbitrary strings that, when changed, will force the null resource to be replaced, re-running any associated provisioners."
  type = map(string)
  default     = null
}