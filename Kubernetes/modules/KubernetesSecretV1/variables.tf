variable "data" {
  description = "A map of the secret data."
  type        = map(string)
  default     = null
}

variable "binary_data" {
  description = "A map base64 encoded map of the secret data."
  type        = map(string)
  default     = null
}

variable "metadata_block" {
  description = "Standard secret's metadata."
  type = object({
    annotations   = optional(map(string))
    generate_name = optional(string)
    labels        = optional(map(string))
    name          = optional(string)
    namespace     = optional(string)
  })
}

variable "type" {
  description = "The secret type."
  type        = string
  default     = "Opaque"
}

variable "immutable" {
  description = "Ensures that data stored in the Secret cannot be updated (only object metadata can be modified)."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.immutable)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "wait_for_service_account_token" {
  description = "Terraform will wait for the service account token to be created."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.wait_for_service_account_token)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = true
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 1)
  })
  default = null
}
