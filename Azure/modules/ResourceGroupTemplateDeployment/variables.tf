variable "deployment_mode" {
  description = "Specifies the mode that is used to deploy resources. This value could be either 'Incremental' or 'Complete'."
  type        = string
  validation {
    condition     = contains(["Incremental", "Complete"], title(var.deployment_mode))
    error_message = "Possible values can only be 'Incremental' or 'Complete'."
  }
  default = "Incremental"
}

variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where this Public IP should exist."
  type        = string
}

variable "debug_level" {
  description = "The Debug Level which should be used for this Resource Group Template Deployment."
  type        = string
  validation {
    condition = contains([
      "none", "requestContent", "responseContent", "requestContent, responseContent"
    ], lower(var.debug_level))
    error_message = "Possible values can only be 'none', 'requestContent', 'responseContent' or 'requestContent, responseContent'."
  }
  default = "none"
}

variable "template_content" {
  description = "The contents of the ARM Template which should be deployed into this Resource Group."
  type        = string
  default     = null
}

variable "template_spec_version_id" {
  description = "The ID of the Template Spec Version to deploy."
  type        = string
  default     = null
}

variable "parameters_content" {
  description = "The contents of the ARM Template parameters file - containing a JSON list of parameters."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
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