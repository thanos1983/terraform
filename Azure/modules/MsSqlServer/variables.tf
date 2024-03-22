variable "name" {
  description = "The name of the MS SQL Server."
  type        = string
}

variable "length" {
  description = "The length of the string desired. The minimum value for length is 1."
  type        = number
  default     = 25
}

variable "lower" {
  description = "Include lowercase alphabet characters in the result."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.lower)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "min_lower" {
  description = "Minimum number of lowercase alphabet characters in the result."
  type        = number
  default     = 2
}

variable "min_numeric" {
  description = "Minimum number of numeric characters in the result."
  type        = number
  default     = 2
}

variable "min_special" {
  description = "Minimum number of special characters in the result."
  type        = number
  default     = 2
}

variable "min_upper" {
  description = "Minimum number of uppercase alphabet characters in the result."
  type        = number
  default     = 2
}

variable "numeric" {
  description = "Include numeric characters in the result."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.numeric)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "special" {
  description = "Include special characters in the result."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.special)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "upper" {
  description = "Include uppercase alphabet characters in the result."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.upper)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "resource_group" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "mssql_server_version" {
  description = "The version for the server. 2.0 (for v11 server) and 12.0 (for v12 server)."
  type        = string
  validation {
    condition     = contains(["2.0", "12.0"], var.mssql_server_version)
    error_message = "The version for the server variable must be \"2.0\" or \"12.0\"."
  }
  default = "12.0"
}

variable "administrator_login" {
  description = "The administrator login name for the new server."
  type        = string
  default     = null
}

variable "administrator_login_password" {
  description = "The administrator login password for the new server."
  type        = string
  default     = null
}

variable "azuread_administrator_block" {
  description = "An azuread_administrator block."
  type        = object({
    login_username              = string
    object_id                   = string
    tenant_id                   = optional(string)
    azuread_authentication_only = optional(bool)
  })
  default = null
}

variable "connection_policy" {
  description = "The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default."
  type        = string
  validation {
    condition     = contains(["Redirect", "Default"], title(var.connection_policy))
    error_message = "The version for the server variable must be \"Default\", \"Proxy\" or \"Redirect\"."
  }
  default = "Default"
}

variable "identity_type" {
  description = "Identity type."
  type        = string
  validation {
    condition = contains([
      "SystemAssigned", "UserAssigned", "SystemAssigned, UserAssigned"
    ], title(var.identity_type))
    error_message = "Identity type variable must be \"SystemAssigned\", \"UserAssigned\" or \"SystemAssigned, UserAssigned\" case sensitive."
  }
  default = "SystemAssigned"
}

variable "minimum_tls_version" {
  description = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server."
  type        = string
  validation {
    condition     = contains(["1.0", "1.1", "1.2"], title(var.minimum_tls_version))
    error_message = "Minimum TLS version variable must be \"1.0\", \"1.1\" or \"1.2\"."
  }
  default = "1.2"
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for this server."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.public_network_access_enabled)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "outbound_network_restriction_enabled" {
  description = "Whether outbound network traffic is restricted for this server."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.outbound_network_restriction_enabled)))
    error_message = "The variable must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "primary_user_assigned_identity_id" {
  description = "Specifies the primary user managed identity id."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}

variable "kv_name" {
  description = "Key Vault if the user desires to create access policy for the DB."
  type        = string
  default     = null
}

variable "kv_rg_name" {
  description = "Key Vault Resource Group (if not defined default RG will be assumed)."
  type        = string
  default     = null
}

variable "secret_permissions" {
  description = "List of secret permissions."
  type        = list(string)
  default     = []
}

variable "firewallRulesMap" {
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
  default = null
}

variable "key_vault_id" {
  description = "The key vault ID for the vault."
  type        = string
  default     = null
}

variable "role_assignment_name" {
  description = "A unique UUID/GUID for this Role Assignment - one will be generated if not specified."
  type        = string
  default     = null
}

variable "role_definition_ids" {
  description = "The Scoped-ID(s) of the Role Definition."
  type        = list(string)
  default     = null
}

variable "role_definition_names" {
  description = "Specifies the role the user will get with the secret(s) in the vault."
  type        = list(string)
  default     = null
}

variable "principal_id" {
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to."
  type        = string
  default     = null
}