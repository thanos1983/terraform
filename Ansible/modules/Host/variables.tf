variable "name" {
  description = "Name of the host."
  type        = string
}

variable "groups" {
  description = "List of group names."
  type = list(string)
  default     = null
}

variable "variables" {
  description = "Map of variables."
  type = map(any)
  default     = null
}