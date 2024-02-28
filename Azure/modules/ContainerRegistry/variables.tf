variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where this Public IP should exist."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the Public IP should exist."
  type        = string
}

variable "sku" {
  description = "The SKU name of the container registry."
  type        = string
  validation {
    condition     = contains(["Standard", "Premium"], title(var.sku))
    error_message = "Possible values are 'Standard' and 'Premium'."
  }
  default = "Standard"
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.admin_enabled)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "georeplications_blocks" {
  description = "Georeplications block supports the following."
  type        = list(object({
    location                  = string
    regional_endpoint_enabled = optional(string)
    zone_redundancy_enabled   = optional(bool, false)
    tags                      = optional(map(any))
  }))
  default = []
}

variable "network_rule_set_block" {
  description = "Network rule set block supports the following."
  type        = object({
    default_action = optional(string)
    ip_rule_blocks = optional(list(object({
      action   = string
      ip_range = string
    })))
  })
  default = null
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for the container registry."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.public_network_access_enabled)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = true
}

variable "quarantine_policy_enabled" {
  description = "Boolean value that indicates whether quarantine policy is enabled."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.quarantine_policy_enabled)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "retention_policy_block" {
  description = "Retention policy block supports the following."
  type        = object({
    days    = optional(string, 7)
    enabled = optional(bool, true)
  })
  default = null
}

variable "trust_policy_block" {
  description = "Trust policy block supports the following."
  type        = object({
    enabled = optional(bool, true)
  })
  default = null
}

variable "zone_redundancy_enabled" {
  description = "Whether zone redundancy is enabled for this Container Registry."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.zone_redundancy_enabled)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "export_policy_enabled" {
  description = "Boolean value that indicates whether export policy is enabled."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.export_policy_enabled)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = true
}

variable "identity_block" {
  description = "Identity block supports the following."
  type        = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "encryption_block" {
  description = "Encryption block supports the following."
  type        = object({
    enabled            = optional(bool)
    key_vault_key_id   = string
    identity_client_id = string
  })
  default = null
}

variable "anonymous_pull_enabled" {
  description = "Whether allows anonymous (unauthenticated) pull access to this Container Registry."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.anonymous_pull_enabled)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "data_endpoint_enabled" {
  description = "Whether to enable dedicated data endpoints for this Container Registry."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.data_endpoint_enabled)))
    error_message = "Possible values are 'true' and 'false'."
  }
  default = false
}

variable "network_rule_bypass_option" {
  description = "Whether to allow trusted Azure services to access a network restricted Container Registry."
  type        = string
  validation {
    condition     = contains(["AzureServices", "None"], title(var.network_rule_bypass_option))
    error_message = "Possible values are 'AzureServices' and 'None'."
  }
  default = "None"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
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

variable "role_assignment_name" {
  description = "A unique UUID/GUID for this Role Assignment."
  type        = string
  default     = null
}

variable "role_definition_names" {
  description = "Specifies the role the user will be assigned to the ACR."
  type        = list(string)
  default     = []
}

variable "role_definition_ids" {
  description = "Specifies the role id the user will be assigned to the ACR."
  type        = list(string)
  default     = []
}

variable "principal_id" {
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to."
  type        = string
  default     = null
}

variable "key_vault_id" {
  description = "The key vault ID for the vault."
  type        = string
  default     = null
}

variable "secret_permissions" {
  description = "List of secret permissions."
  type        = list(string)
  default     = null
}