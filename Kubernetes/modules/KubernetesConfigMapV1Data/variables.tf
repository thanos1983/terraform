variable "metadata_block" {
  description = "Standard ingress's metadata."
  type = object({
    name      = string
    namespace = optional(string)
  })
}

variable "data" {
  description = "Data contains the configuration data."
  type        = map(string)
}

variable "field_manager" {
  description = "Set the name of the field manager for the specified labels."
  type        = string
  default     = null
}

variable "force" {
  description = "Force overwriting data that is managed outside of Terraform."
  type        = bool
  default     = null
}
