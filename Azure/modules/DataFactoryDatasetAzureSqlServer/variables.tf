variable "name" {
  description = "Specifies the name of the Data Factory Linked Service Azure SQL Database."
  type        = string
}

variable "data_factory_id" {
  description = "The Data Factory ID in which to associate the Linked Service with."
  type        = string
}

variable "propertiesAnnotations" {
  description = "List of tags that can be used for describing the Dataset."
  type        = list(string)
  default     = []
}

variable "propertiesFolder" {
  description = "The folder that this Dataset is in."
  type        = string
  default     = null
}

variable "linkedServiceParameters" {
  description = "Arguments for LinkedService."
  type        = map(string)
  default     = {}
}

variable "linkedServiceReferenceName" {
  description = "The Data Factory Linked Service name in which to associate the Dataset with."
  type        = string
}

variable "linkedServiceType" {
  description = "The Data Factory Linked Service type in which to associate the Dataset with."
  type        = string
}

variable "propertiesParameters" {
  description = "Parameters for dataset."
  type        = map(string)
  default     = {}
}

variable "propertiesStructure" {
  description = "Columns that define the structure of the dataset."
  type        = list(any)
  default     = null
}

variable "propertiesType" {
  description = "Set the object type."
  type        = string
  default     = "AzureSqlTable"
}

variable "propertiesTypePropertiesSchema" {
  description = "The schema name of the Azure SQL database."
  type        = string
  default     = null
}

variable "propertiesTypePropertiesTable" {
  description = "The table name of the Azure SQL database."
  type        = string
  default     = null
}

variable "propertiesTypePropertiesTableName" {
  description = "The table name of the Azure SQL database."
  type        = string
  default     = null
}
