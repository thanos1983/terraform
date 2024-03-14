variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where this Public IP should exist."
  type        = string
}

variable "deployment_mode" {
  description = "Specifies the mode that is used to deploy resources. This value could be either 'Incremental' or 'Complete'."
  type        = string
  validation {
    condition     = contains(["Incremental", "Complete"], title(var.deployment_mode))
    error_message = "Possible values can only be 'Incremental' or 'Complete'."
  }
  default = "Incremental"
}

variable "template_body" {
  description = "Specifies the JSON definition for the template."
  type        = string
  default     = null
}

variable "parameters" {
  description = "Specifies the name and value pairs that define the deployment parameters for the template."
  type        = map(string)
  default     = null
}

variable "parameters_body" {
  description = "Specifies a valid Azure JSON parameters file that define the deployment parameters."
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