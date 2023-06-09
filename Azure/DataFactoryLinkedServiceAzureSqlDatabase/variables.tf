variable "name" {
  description = "Specifies the name of the Data Factory Linked Service Azure SQL Database."
  type        = string
}

variable "data_factory_id" {
  description = "The Data Factory ID in which to associate the Linked Service with."
  type        = string
}

variable "connection_string" {
  description = "The connection string in which to authenticate with Azure SQL Database."
  type        = string
  default     = null
}

variable "use_managed_identity" {
  description = "Whether to use the Data Factory's managed identity to authenticate against the Azure SQL Database."
  type        = string
  default     = null
}

variable "service_principal_id" {
  description = "The service principal id in which to authenticate against the Azure SQL Database."
  type        = string
  default     = null
}

variable "service_principal_key" {
  description = "The service principal key in which to authenticate against the Azure SQL Database."
  type        = string
  default     = null
}

variable "tenant_id" {
  description = "The tenant id or name in which to authenticate against the Azure SQL Database."
  type        = string
  default     = null
}

variable "description" {
  description = "The description for the Data Factory Linked Service Azure SQL Database."
  type        = string
  default     = null
}

variable "integration_runtime_name" {
  description = "The integration runtime reference to associate with the Data Factory Linked Service Azure SQL Database."
  type        = string
  default     = null
}

variable "annotations" {
  description = "List of tags that can be used for describing the Data Factory Linked Service Azure SQL Database."
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

variable "key_vault_connection_string_block" {
  description = "A key_vault_connection_string block as defined below. Use this argument to store Azure SQL Database connection string in an existing Key Vault."
  type        = object({
    linked_service_name = string
    secret_name         = string
  })
  default = null
}

variable "key_vault_password_block" {
  description = "A key_vault_password block as defined below. Use this argument to store SQL Server password in an existing Key Vault."
  type        = object({
    linked_service_name = string
    secret_name         = string
  })
  default = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}