variable "name" {
  description = "The name of the virtual machine extension peering."
  type        = string
}

variable "virtual_machine_id" {
  description = "The ID of the Virtual Machine."
  type        = string
}

variable "publisher" {
  description = "The publisher of the extension, available publishers can be found by using the Azure CLI."
  type        = string
}

variable "type" {
  description = "The type of extension, available types for a publisher can be found using the Azure CLI."
  type        = string
}

variable "type_handler_version" {
  description = "Specifies the version of the extension to use, available versions can be found using the Azure CLI."
  type        = string
}

variable "auto_upgrade_minor_version" {
  description = "Specifies if the platform deploys the latest minor version update to the type_handler_version specified."
  type        = string
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.auto_upgrade_minor_version)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "automatic_upgrade_enabled" {
  description = "Should the Extension be automatically updated whenever the Publisher releases a new version of this VM Extension?"
  type        = string
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.automatic_upgrade_enabled)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "settings" {
  description = "The settings passed to the extension, these are specified as a JSON object in a string."
  type        = string
  default     = null
}

variable "failure_suppression_enabled" {
  description = "Should failures from the extension be suppressed?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.failure_suppression_enabled)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "protected_settings" {
  description = "The protected_settings passed to the extension, like settings, these are specified as a JSON object in a string."
  type        = string
  default     = null
}

variable "protected_settings_from_key_vault_block" {
  description = "A protected_settings_from_key_vault block."
  type = object({
    secret_url      = string
    source_vault_id = string
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
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
