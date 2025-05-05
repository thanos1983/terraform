variable "arc_machine_id" {
  description = "The ID of the Hybrid Compute Machine Extension."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Arc Machine should exist."
  type        = string
}

variable "name" {
  description = "The name of the Arc machine."
  type        = string
}

variable "publisher" {
  description = "The name of the extension handler publisher, such as Microsoft.Azure.Monitor."
  type        = string
}

variable "type" {
  description = "Specifies the type of the extension."
  type        = string
}

variable "automatic_upgrade_enabled" {
  description = "Indicates whether the extension should be automatically upgraded by the platform if there is a newer version available."
  type        = bool
  default     = true
}

variable "force_update_tag" {
  description = "How the extension handler should be forced to update even if the extension configuration has not changed."
  type        = bool
  default     = false
}

variable "protected_settings" {
  description = "Json formatted protected settings for the extension."
  type = map(any)
  default     = null
}

variable "settings" {
  description = "Json formatted public settings for the extension."
  type = map(any)
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the Arc Machine."
  type        = string
  default     = null
}

variable "type_handler_version" {
  description = "Specifies the version of the script handler."
  type        = string
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type = object({
    create = optional(number, 30)
    read = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}
