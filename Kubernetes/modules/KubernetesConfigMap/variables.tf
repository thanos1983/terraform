variable "metadata_block" {
  description = "Standard ingress's metadata."
  type = object({
    annotations   = optional(map(string))
    generate_name = optional(string)
    labels        = optional(map(string))
    name          = optional(string)
    namespace     = optional(string)
  })
}

variable "binary_data" {
  description = "BinaryData contains the binary data."
  type        = map(string)
  default     = null
}

variable "data" {
  description = "Data contains the configuration data."
  type        = map(string)
  default     = null
}

variable "immutable" {
  description = "Immutable, if set to true, ensures that data stored in the ConfigMap cannot be updated (only object metadata can be modified)."
  type        = bool
  default     = false
}
