variable "name" {
  description = "The name of the Container which should be created within the Storage Account."
  type        = string
}

variable "storage_account_id" {
  description = "The id of the Storage Account where the Container should be created."
  type        = string
}

variable "container_access_type" {
  description = "The Access Level configured for this Container."
  type        = string
  validation {
    condition     = contains(["blob", "container", "private"], lower(var.container_access_type))
    error_message = "The Access Level must be \"blob\", \"container\" or \"private\"."
  }
  default = "private"
}

variable "default_encryption_scope" {
  description = "The default encryption scope to use for blobs uploaded to this container."
  type        = string
  default     = null
}

variable "encryption_scope_override_enabled" {
  description = "Whether to allow blobs to override the default encryption scope for this container."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.encryption_scope_override_enabled)))
    error_message = "The default encryption scope must be \"true\" or \"false\"."
  }
  default = true
}

variable "metadata" {
  description = "A mapping of MetaData for this Container."
  type        = map(any)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}
