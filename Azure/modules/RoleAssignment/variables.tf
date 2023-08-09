variable "name" {
  description = "Specifies the name of this User Assigned Identity."
  type        = string
  default     = null
}

variable "scope" {
  description = "The scope at which the Role Assignment applies to."
  type        = string
}

variable "role_definition_id" {
  description = "The Scoped-ID of the Role Definition."
  type        = string
  default     = null
}

variable "role_definition_name" {
  description = "The name of a built-in Role."
  type        = string
  default     = null
}

variable "principal_id" {
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to."
  type        = string
}

variable "condition" {
  description = "The condition that limits the resources that the role can be assigned to."
  type        = string
  default     = null
}

variable "condition_version" {
  description = "The version of the condition. Possible values are 1.0 or 2.0"
  type        = string
  default     = null
}

variable "delegated_managed_identity_resource_id" {
  description = "The delegated Azure Resource Id which contains a Managed Identity."
  type        = string
  default     = null
}

variable "description" {
  description = "The description for this Role Assignment."
  type        = string
  default     = null
}

variable "skip_service_principal_aad_check" {
  description = " If the principal_id is a newly provisioned Service Principal set this value to true to skip the Azure Active Directory check which may fail due to replication lag."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.skip_service_principal_aad_check)))
    error_message = "Parameter must be \"true\" or \"false\"."
  }
  default = false
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}