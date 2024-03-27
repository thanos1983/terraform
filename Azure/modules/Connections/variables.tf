variable "type" {
  description = "The resource type."
  type        = string
  default     = "Microsoft.Web/connections@2018-07-01-preview"
}

variable "name" {
  description = "Specifies the name of the azure resource."
  type        = string
}

variable "location" {
  description = "Resource location"
  type        = string
  default     = null
}

variable "parent_id" {
  description = "To deploy to a resource group, use the ID of that resource group."
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = null
}

variable "schema_validation_enabled" {
  description = "AzApi provider will use embedded schema to verify the inputs, to skip the validation."
  type        = bool
  default     = true
}

variable "etag" {
  description = "Resource ETag."
  type        = string
  default     = null
}

variable "api" {
  description = "Api configurations."
  type        = object({
    brandColor  = optional(string)
    description = optional(string)
    displayName = optional(string)
    iconUri     = optional(string)
    id          = string
    name        = optional(string)
    swagger     = optional(string)
    type        = string
  })
}

variable "customParameterValues" {
  description = "Dictionary of custom parameter values."
  type        = map(string)
  default     = null
}

variable "displayName" {
  description = "Display name."
  type        = string
  default     = null
}

variable "parameterValueSet" {
  description = "The parameterValueSet object includes a name property that's set to managedIdentityAuth and a values property that's set to an empty object."
  type        = any
  default     = null
}

variable "nonSecretParameterValues" {
  description = "Dictionary of nonsecret parameter values."
  type        = map(string)
  default     = null
}

variable "parameterValues" {
  description = "Dictionary of parameter values."
  type        = map(string)
  default     = null
}

variable "statuses" {
  description = "Status of the connection."
  type        = list(object({
    error = optional(object({
      etag       = string
      location   = string
      properties = optional(object({
        code    = string
        message = string
      }))
      tags = optional(map(string))
    }))
    status = string
    target = optional(string)
  }))
  default = null
}

variable "testLinks" {
  description = "Links to test the API connection."
  type        = list(object({
    method     = string
    requestUri = string
  }))
  default = null
}