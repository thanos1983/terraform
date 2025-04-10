variable "name" {
  description = "Name of the Placement Group."
  type        = string
  default     = null
}

variable "type" {
  description = "Type of the Placement Group."
  type        = string
}

variable "labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type = map(any)
  default     = null
}