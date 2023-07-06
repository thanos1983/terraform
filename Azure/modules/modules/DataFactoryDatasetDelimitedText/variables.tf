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
}

variable "schema_column_block" {
  description = "A schema_column block."
  type        = list(object({
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

variable "azure_blob_fs_location_block" {
  description = "Azure fs blob location."
  type        = object({
    file_system = string
    path        = optional(string)
    filename    = optional(string)
  })
  default = null
}

variable "azure_blob_storage_location_block" {
  description = "Azure blob location."
  type        = object({
    container                 = string
    path                      = optional(string)
    filename                  = optional(string)
    dynamic_container_enabled = optional(bool)
    dynamic_path_enabled      = optional(bool)
    dynamic_filename_enabled  = optional(bool)
  })
  default = null
}

variable "http_server_location_block" {
  description = "Http_server_location block."
  type        = object({
    relative_url             = string
    path                     = string
    filename                 = string
    dynamic_path_enabled     = optional(bool)
    dynamic_filename_enabled = optional(bool)
  })
  default = null
}

variable "column_delimiter" {
  description = "The column delimiter."
  type        = string
  default     = ","
}

variable "row_delimiter" {
  description = "The row delimiter."
  type        = string
  validation {
    condition = contains([
      "\r\n", "\r", "\n"
    ], var.row_delimiter)
    error_message = "The row delimiter accepted values can be only \"\\r\\n\", \"\\r\" or \"\\n\"."
  }
  default = "\r\n"
}

variable "encoding" {
  description = "The encoding format for the file."
  type        = string
  default     = "UTF-8"
}

variable "quote_character" {
  description = "The quote character."
  type        = string
  default     = "\""
}

variable "escape_character" {
  description = "The escape character."
  type        = string
  default     = "\\"
}

variable "first_row_as_header" {
  description = "When used as input, treat the first row of data as headers."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.first_row_as_header)))
    error_message = "The accepted parameter can be only \"true\" or \"false\" as bool."
  }
  default = false
}

variable "null_value" {
  description = "The null value string. Defaults to an empty string."
  type        = string
  default     = "\"\""
}

variable "compression_codec" {
  description = "The compression codec used to read/write text files."
  type        = string
  validation {
    condition = contains([
      "None", "bzip2", "gzip", "deflate", "ZipDeflate", "TarGzip", "Tar", "snappy", "lz4"
    ], var.compression_codec)
    error_message = "The accepted parameter can be only \"None\", \"bzip2\", \"gzip\", \"deflate\", \"ZipDeflate\", \"TarGzip\", \"Tar\", \"snappy\" or \"lz4\"."
  }
  default = "None"
}

variable "compression_level" {
  description = "The compression ratio for the Data Factory Dataset."
  type        = string
  validation {
    condition     = contains(["Fastest", "Optimal"], title(var.compression_level))
    error_message = "The accepted parameter can be only \"Fastest\" or \"Optimal\"."
  }
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