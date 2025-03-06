variable "metadata" {
  description = "The metadata of agent access key."
  type = map(any)
  default = {}
}

variable "team_id" {
  description = "The team id of the agent access key."
  type        = string
  default     = null
}

variable "limit" {
  description = "The limit of the agent access key."
  type        = number
  default     = null
}

variable "reservation" {
  description = "The reservation of the agent access key."
  type        = number
  default     = null
}

variable "enabled" {
  description = "Whether the agent access key is enabled or not."
  type        = bool
  default     = true
}
