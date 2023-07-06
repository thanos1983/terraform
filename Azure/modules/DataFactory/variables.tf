variable "name" {
  description = "Specifies the name of the Data Factory."
  type        = string
}

variable "resource_group" {
  description = "The name of the resource group in which to create the Data Factory."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "github_configuration_block" {
  description = "A github_configuration block."
  type        = object({
    account_name    = string
    branch_name     = string
    git_url         = string
    repository_name = string
    root_folder     = string
  })
  default = null
}

variable "global_parameter_block" {
  description = "A set of objects global_parameter blocks."
  type        = set(object({
    name  = string
    type  = string
    value = string
  }))
  default = []
}

variable "identity_type" {
  description = "Identity type."
  type        = string
  validation {
    condition     = contains([
      "SystemAssigned", "UserAssigned", "SystemAssigned, UserAssigned"
    ], title(var.identity_type))
    error_message = "Identity type variable must be \"SystemAssigned\", \"UserAssigned\" or \"SystemAssigned, UserAssigned\" case sensitive."
  }
  default = "SystemAssigned"
}

variable "identity_ids" {
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Data Factory."
  type        = set(string)
  default     = null
}

variable "vsts_configuration_block" {
  description = "A vsts_configuration block."
  type        = object({
    account_name    = string
    branch_name     = string
    project_name    = string
    repository_name = string
    root_folder     = string
    tenant_id       = string
  })
  default = null
}

variable "managed_virtual_network_enabled" {
  description = "Is Managed Virtual Network enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.managed_virtual_network_enabled)))
    error_message = "Infrastructure encryption variable must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "public_network_enabled" {
  description = "Is the Data Factory visible to the public network?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.public_network_enabled)))
    error_message = "Infrastructure encryption variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "customer_managed_key_id" {
  description = "Specifies the Azure Key Vault Key ID to be used as the Customer Managed Key (CMK) for double encryption."
  type        = string
  default     = null
}

variable "customer_managed_key_identity_id" {
  description = "Specifies the ID of the user assigned identity associated with the Customer Managed Key."
  type        = string
  default     = null
}

variable "purview_id" {
  description = "Specifies the ID of the purview account resource associated with the Data Factory."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}