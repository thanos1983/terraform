variable "name" {
  description = "Specifies the name of the Data Factory Linked Service Azure SQL Database."
  type        = string
}

variable "data_factory_id" {
  description = "The Data Factory ID in which to associate the Linked Service with."
  type        = string
}

variable "description" {
  description = "The description for the Data Factory Pipeline."
  type        = string
  default     = null
}

variable "annotations" {
  description = "List of tags that can be used for describing the Data Factory Linked Service Key Vault."
  type        = set(string)
  default     = null
}

variable "concurrency" {
  description = "The max number of concurrent runs for the Data Factory Pipeline. Must be between 1 and 50."
  type        = number
  validation {
    condition     = var.concurrency >= 1 && var.concurrency <= 50
    error_message = "Accepted values: 1-50."
  }
  default = 1
}

variable "folder" {
  description = "The folder that this Pipeline is in."
  type        = string
  default     = null
}

variable "moniter_metrics_after_duration" {
  description = "The TimeSpan value after which an Azure Monitoring Metric is fired."
  type        = string
  default     = null
}

variable "parameters" {
  description = "A map of parameters to associate with the Data Factory Linked Service Azure SQL Database."
  type        = map(any)
  default     = null
}

variable "variables" {
  description = "A map of variables to associate with the Data Factory Pipeline."
  type        = map(any)
  default     = null
}

variable "activities_json" {
  description = "A JSON object that contains the activities that will be associated with the Data Factory Pipeline."
  type        = string
  default     = null
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