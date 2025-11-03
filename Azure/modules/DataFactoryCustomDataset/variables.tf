variable "name" {
  description = "Specifies the name of the Data Factory Linked Service Azure SQL Database."
  type        = string
}

variable "data_factory_id" {
  description = "The Data Factory ID in which to associate the Linked Service with."
  type        = string
}

variable "linked_service_name" {
  description = "The name of the Data Factory Linked Service."
  type        = string
}

variable "linked_service_parameters" {
  description = "A map of parameters to associate with the Data Factory Linked Service."
  type        = map(string)
  default     = null
}

variable "type" {
  description = "The type of dataset that will be associated with Data Factory."
  type        = string
}

variable "type_properties_json" {
  description = "A JSON object that contains the properties of the Data Factory Dataset."
  type        = string
}

variable "additional_properties" {
  description = "A map of additional properties to associate with the Data Factory Linked Service Azure SQL Database."
  type        = map(any)
  default     = null
}

variable "annotations" {
  description = "List of tags that can be used for describing the Data Factory Linked Service Azure SQL Database."
  type        = set(string)
  default     = null
}

variable "description" {
  description = "The description for the Data Factory Linked Service Azure SQL Database."
  type        = string
  default     = null
}

variable "folder" {
  description = "The folder that this Dataset is in."
  type        = string
  default     = null
}

variable "parameters" {
  description = "A map of parameters to associate with the Data Factory Linked Service Azure SQL Database."
  type        = map(any)
  default     = null
}

variable "schema_json" {
  description = "A JSON object that contains the schema of the Data Factory Dataset."
  type        = string
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
