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

variable "type" {
  description = "It is in a format like <resource-type>@<api-version>. <resource-type> is the Azure resource type, for example, Microsoft.Storage/storageAccounts. <api-version> is version of the API used to manage this azure resource."
  type        = string
}

variable "body" {
  description = "A JSON object that contains the request body used to add on an existing azure resource."
  type        = string
}

variable "response_export_values" {
  description = "A list of path that needs to be exported from response body."
  type        = list(string)
  default     = null
}

variable "locks" {
  description = "A list of ARM resource IDs which are used to avoid create/modify/delete azapi resources at the same time."
  type        = list(string)
  default     = null
}

variable "ignore_casing" {
  description = "Whether ignore incorrect casing returned in body to suppress plan-diff."
  type        = bool
  default     = false
}

variable "ignore_body_changes" {
  description = "A list of properties that should be ignored when comparing the body with its current state."
  type        = list(string)
  default     = null
}

variable "ignore_missing_property" {
  description = "Whether ignore not returned properties like credentials in 'body' to suppress plan-diff."
  type        = bool
  default     = true
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    delete = optional(number, 30)
  })
  default = null
}