variable "name" {
  description = "Specifies the name of the Key Vault Secret."
  type        = string
}

variable "value" {
  description = "Specifies the value of the Key Vault Secret."
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the Key Vault where the Secret should be created."
  type        = string
}

variable "content_type" {
  description = "Specifies the content type for the Key Vault Secret."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}

variable "not_before_date" {
  description = "Key not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z')."
  type        = string
  default     = null
}

variable "expiration_date" {
  description = "Expiration UTC datetime (Y-m-d'T'H:M:S'Z')."
  type        = string
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read   = optional(number, 30)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}
