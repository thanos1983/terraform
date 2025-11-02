variable "name" {
  description = "The name for this Container App."
  type        = string
}

variable "cognitive_account_id" {
  description = "The ID of the Cognitive Services Account. Changing this forces a new resource to be created."
  type        = string
}

variable "model_block" {
  description = "A model block as defined below."
  type = object({
    format  = string
    name    = string
    version = optional(string)
  })
  default = null
}

variable "scale_block" {
  description = "A scale block as defined below."
  type = object({
    type     = string
    tier     = optional(string)
    size     = optional(string)
    family   = optional(string)
    capacity = optional(string)
  })
  default = null
}

variable "rai_policy_name" {
  description = "The name of RAI policy."
  type        = string
  default     = null
}

variable "version_upgrade_option" {
  description = "Deployment model version upgrade option."
  type        = string
  validation {
    condition     = contains(["OnceNewDefaultVersionAvailable", "OnceCurrentVersionExpired"], title(var.version_upgrade_option))
    error_message = "Parameter must be 'OnceNewDefaultVersionAvailable' or 'OnceCurrentVersionExpired'."
  }
  default = "OnceNewDefaultVersionAvailable"
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
