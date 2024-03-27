variable "type" {
  description = "The resource type."
  type        = string
  default     = "Microsoft.Web/connections@2016-06-01"
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
  default     = {}
}

variable "displayName" {
  description = "Display name."
  type        = string
  default     = null
}

variable "nonSecretParameterValues" {
  description = "Dictionary of nonsecret parameter values."
  type        = map(string)
  default     = {}
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