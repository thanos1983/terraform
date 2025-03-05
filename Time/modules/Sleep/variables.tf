variable "create_duration" {
  description = "Time duration to delay resource creation."
  type        = string
  default     = null
}

variable "destroy_duration" {
  description = "Time duration to delay resource destroy."
  type        = string
  default     = null
}

variable "triggers" {
  description = "Arbitrary map of values that, when changed, will run any creation or destroy delays again."
  type = map(any)
  default = {}
}
