variable "type" {
  description = "It is in a format like <resource-type>@<api-version>. <resource-type> is the Azure resource type, for example, Microsoft.Storage/storageAccounts. <api-version> is version of the API used to manage this azure resource."
  type        = string
}

variable "body" {
  description = "A JSON object that contains the request body used to add on an existing azure resource."
  type        = string
}

variable "ignore_casing" {
  description = "Whether ignore incorrect casing returned in body to suppress plan-diff."
  type        = bool
  default     = false
}

variable "ignore_missing_property" {
  description = "Whether ignore not returned properties like credentials in 'body' to suppress plan-diff."
  type        = bool
  default     = true
}

variable "locks" {
  description = "A list of ARM resource IDs which are used to avoid create/modify/delete azapi resources at the same time."
  type        = list(string)
  default     = []
}

variable "name" {
  description = "Specifies the name of the azure resource."
  type        = string
  default     = null
}

variable "parent_id" {
  description = "The ID of the azure resource in which this resource is created."
  type        = string
  default     = null
}

variable "read_headers" {
  description = "A mapping of headers to be sent with the read request."
  type        = map(string)
  default     = {}
}

variable "read_query_parameters" {
  description = "A mapping of query parameters to be sent with the read request."
  type        = map(list(string))
  default     = {}
}

variable "resource_id" {
  description = "The ID of an existing Azure source."
  type        = string
  default     = null
}

variable "response_export_values" {
  description = "A list of path that needs to be exported from response body."
  type        = list(string)
  default     = []
}

variable "retry_block" {
  description = "The retry object supports the following attributes."
  type = object({
    error_message_regex  = list(string)
    interval_seconds     = optional(number, 10)
    max_interval_seconds = optional(number, 180)
  })
  default = null
}

variable "sensitive_body" {
  description = "A dynamic attribute that contains the write-only properties of the request body. "
  type        = map(list(string))
  default     = {}
}

variable "sensitive_body_version" {
  description = "A map where the key is the path to the property in sensitive_body and the value is the version of the property."
  type        = map(string)
  default     = null
}

variable "update_headers" {
  description = "A mapping of headers to be sent with the update request."
  type        = map(string)
  default     = null
}

variable "update_query_parameters" {
  description = "A mapping of query parameters to be sent with the update request."
  type        = map(list(string))
  default     = {}
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    delete = optional(number, 30)
  })
  default = null
}
