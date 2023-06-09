variable "length" {
  description = "The length of the string desired. The minimum value for length is 1."
  type        = number
  default     = 16
}

variable "keepers" {
  description = "Arbitrary map of values that, when changed, will trigger recreation of resource."
  type        = map(string)
  default     = null
}

variable "lower" {
  description = "Include lowercase alphabet characters in the result."
  type        = bool
  default     = true
}

variable "min_lower" {
  description = "Minimum number of lowercase alphabet characters in the result."
  type        = number
  default     = 2
}

variable "min_numeric" {
  description = "Minimum number of numeric characters in the result."
  type        = number
  default     = 2
}

variable "min_special" {
  description = "Minimum number of special characters in the result."
  type        = number
  default     = 2
}

variable "min_upper" {
  description = "Minimum number of uppercase alphabet characters in the result."
  type        = number
  default     = 2
}

variable "numeric" {
  description = "Include numeric characters in the result."
  type        = bool
  default     = true
}

variable "override_special" {
  description = "Supply your own list of special characters to use for string generation."
  type        = string
  default     = "!#$%&*()-_=+[]{}<>:?"
}

variable "special" {
  description = "Include special characters in the result."
  type        = bool
  default     = true
}

variable "upper" {
  description = "Include uppercase alphabet characters in the result."
  type        = bool
  default     = true
}