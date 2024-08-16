variable "managed_api_id" {
  description = "The ID of the Managed API which this API Connection is linked to."
  type        = string
}

variable "name" {
  description = "The Name which should be used for this API Connection."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where this API Connection should exist."
  type        = string
}

variable "display_name" {
  description = "A display name for this API Connection."
  type        = string
  default     = null
}

variable "parameter_values" {
  description = "A map of parameter values associated with this API Connection."
  type        = map(string)
  default     = null
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the API Connection."
  type        = map(string)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions."
  type        = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}