variable "name" {
  description = "Name of the group."
  type        = string
}

variable "children" {
  description = "List of group children."
  type = list(string)
  default     = null
}

variable "variables" {
  description = "Map of variables."
  type = map(any)
  default     = null
}