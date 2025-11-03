variable "name" {
  description = "Specifies the name of the Data Factory Linked Service Key Vault."
  type        = string
}

variable "data_factory_id" {
  description = "The Data Factory ID in which to associate the Linked Service with."
  type        = string
}

variable "key_vault_id" {
  description = "The ID the Azure Key Vault resource."
  type        = string
}

variable "description" {
  description = "The description for the Data Factory Linked Service Key Vault."
  type        = string
  default     = null
}

variable "integration_runtime_name" {
  description = "The integration runtime reference to associate with the Data Factory Linked Service Key Vault."
  type        = number
  default     = null
}

variable "annotations" {
  description = "List of tags that can be used for describing the Data Factory Linked Service Key Vault."
  type        = set(string)
  default     = null
}

variable "parameters" {
  description = "A map of parameters to associate with the Data Factory Linked Service Azure SQL Database."
  type        = map(any)
  default     = null
}

variable "additional_properties" {
  description = "A map of additional properties to associate with the Data Factory Linked Service Azure SQL Database."
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
