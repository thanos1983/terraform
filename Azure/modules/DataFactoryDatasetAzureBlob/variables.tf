variable "name" {
  description = "Specifies the name of the Data Factory Dataset."
  type        = string
}

variable "data_factory_id" {
  description = "The Data Factory ID in which to associate the Linked Service with."
  type        = string
}

variable "linked_service_name" {
  description = "The Data Factory Linked Service name in which to associate the Dataset with."
  type        = string
}

variable "folder" {
  description = "The folder that this Dataset is in. If not specified, the Dataset will appear at the root level."
  type        = string
  default     = null
}

variable "schema_column_block" {
  description = "A schema_column block."
  type = list(object({
    name        = string
    type        = optional(string)
    description = optional(string)
  }))
  default = []
}

variable "description" {
  description = "The description for the Data Factory Linked Service Key Vault."
  type        = string
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

variable "path" {
  description = "The path of the Azure Blob."
  type        = string
}

variable "filename" {
  description = "The filename of the Azure Blob."
  type        = string
}

variable "dynamic_path_enabled" {
  description = " Is the path using dynamic expression, function or system variables?"
  type        = bool
  default     = false
}

variable "dynamic_filename_enabled" {
  description = "Is the filename using dynamic expression, function or system variables?"
  type        = bool
  default     = false
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
