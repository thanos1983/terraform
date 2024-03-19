variable "name" {
  description = "Specifies the name of the Logic App Changing this forces a new resource to be created. "
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Logic App."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "access_control_block" {
  description = "A access_control block as defined below."
  type        = object({
    action_block = optional(object({
      allowed_caller_ip_address_range = list(string)
    }), null)
    content_block = optional(object({
      allowed_caller_ip_address_range = list(string)
    }), null)
    trigger_block = optional(object({
      allowed_caller_ip_address_range  = list(string)
      open_authentication_policy_block = optional(object({
        name        = string
        claim_block = object({
          name  = string
          value = string
        })
      }), null)
    }), null)
    workflow_management_block = optional(object({
      allowed_caller_ip_address_range = list(string)
    }), null)
  })
  default = null
}

variable "identity_block" {
  description = "Customer managed keys dynamic block."
  type        = object({
    type         = string
    identity_ids = optional(set(string))
  })
  default = null
}

variable "integration_service_environment_id" {
  description = "The ID of the Integration Service Environment to which this Logic App Workflow belongs."
  type        = string
  default     = null
}

variable "logic_app_integration_account_id" {
  description = "The ID of the integration account linked by this Logic App Workflow."
  type        = string
  default     = null
}

variable "enabled" {
  description = "Is the Logic App Workflow enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enabled)))
    error_message = "The variable must be 'true' or 'false'."
  }
  default = true
}

variable "workflow_parameters" {
  description = "Specifies a map of Key-Value pairs of the Parameter Definitions to use for this Logic App Workflow."
  type        = map(string)
  default     = null
}

variable "workflow_schema" {
  description = "Specifies the Schema to use for this Logic App Workflow."
  type        = string
  default     = null
}

variable "workflow_version" {
  description = "Specifies the version of the Schema used for this Logic App Workflow."
  type        = string
  default     = "1.0.0.0"
}

variable "parameters" {
  description = "A map of Key-Value pairs."
  type        = map(string)
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
    update = optional(number, 30)
    read   = optional(number, 5)
    delete = optional(number, 30)
  })
  default = null
}