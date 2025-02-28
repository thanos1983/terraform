variable "name" {
  description = "The name of the Secure rule. It must be unique."
  type        = string
}

variable "description" {
  description = "The description of Secure rule. By default is empty."
  type        = string
  default     = null
}

variable "tags" {
  description = "A list of tags for this rule."
  type = list(string)
  default = []
}

variable "matching" {
  description = "Defines if the image name matches or not with the provided list."
  type        = bool
  default     = true
}

variable "containers" {
  description = "List of containers to match."
  type = list(string)
}
