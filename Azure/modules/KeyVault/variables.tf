variable "name" {
  description = "Specifies the name of the Key Vault."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "resource_group" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
}

variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault."
  type        = string
  validation {
    condition     = contains(["standard", "premium"], lower(var.sku_name))
    error_message = "Sku name must be \"standard\" or \"premium\"."
  }
  default = "standard"
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
  type        = string
}

variable "object_id" {
  description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault."
  type        = string
  default     = null
}

variable "enabled_for_deployment" {
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enabled_for_deployment)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "enabled_for_disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enabled_for_disk_encryption)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "enabled_for_template_deployment" {
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enabled_for_template_deployment)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "enable_rbac_authorization" {
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enable_rbac_authorization)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "network_acls_block" {
  description = "Network ACL block."
  type        = object({
    bypass                     = string
    default_action             = string
    ip_rules                   = optional(list(string))
    virtual_network_subnet_ids = optional(list(string))
  })
  default = null
}

variable "purge_protection_enabled" {
  description = "Is Purge Protection enabled for this Key Vault?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.purge_protection_enabled)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for this Key Vault."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.public_network_access_enabled)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted."
  type        = number
  validation {
    condition     = (var.soft_delete_retention_days >= 7 && var.soft_delete_retention_days <= 90)
    error_message = "Parameter must be between \"7\" and \"90\" days as number."
  }
  default = 90
}

variable "contact_block" {
  description = "Contact block."
  type        = object({
    email = string
    name  = optional(string)
    phone = optional(string)
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}

variable "certificate_permissions" {
  description = "List of certificate permissions."
  type        = list(string)
  validation {
    condition = alltrue([
      for certificate_permission in var.certificate_permissions : contains([
        "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers",
        "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"
      ], certificate_permission)
    ])
    error_message = "Parameter cam be one or combination of \"Backup\", \"Create\", \"Delete\", \"DeleteIssuers\", \"Get\", \"GetIssuers\", \"Import\", \"List\", \"ListIssuers\", \"ManageContacts\", \"ManageIssuers\", \"Purge\", \"Recover\", \"Restore\", \"SetIssuers\", \"Update\"."
  }
  default = ["List"]
}

variable "key_permissions" {
  description = "List of certificate permissions."
  type        = list(string)
  validation {
    condition = alltrue([
      for key_permission in var.key_permissions : contains([
        "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore",
        "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy",
        "SetRotationPolicy"
      ], key_permission)
    ])
    error_message = "Parameter cam be one or combination of \"Backup\", \"Create\", \"Decrypt\", \"Delete\", \"Encrypt\", \"Get\", \"Import\", \"List\", \"Purge\", \"Recover\", \"Restore\", \"Sign\", \"UnwrapKey\", \"Update\", \"Verify\", \"WrapKey\", \"Release\", \"Rotate\", \"GetRotationPolicy\" and \"SetRotationPolicy\"."
  }
  default = ["List"]
}

variable "secret_permissions" {
  description = "List of secret permissions."
  type        = list(string)
  validation {
    condition = alltrue([
      for secret_permission in var.secret_permissions : contains([
        "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
      ], secret_permission)
    ])
    error_message = "Parameter cam be one or combination of \"Backup\", \"Delete\", \"Get\", \"List\", \"Purge\", \"Recover\", \"Restore\" and \"Set\"."
  }
  default = ["List"]
}

variable "storage_permissions" {
  description = "List of storage permissions."
  type        = list(string)
  validation {
    condition = alltrue([
      for storage_permission in var.storage_permissions : contains([
        "Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey",
        "Restore", "Set", "SetSAS", "Update"
      ], storage_permission)
    ])
    error_message = "Parameter cam be one or combination of \"Backup\", \"Delete\", \"DeleteSAS\", \"Get\", \"GetSAS\", \"List\", \"ListSAS\", \"Purge\", \"Recover\", \"RegenerateKey\", \"Restore\", \"Set\", \"SetSAS\", \"Update\"."
  }
  default = ["List"]
}

variable "kv_access_policy" {
  description = "Enable access policy for the specific KV."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.kv_access_policy)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "role_assignment_name" {
  description = "Enable RBAC for the specific KV."
  type        = string
  default     = null
}

variable "role_definition_names" {
  description = "Specifies the role the user will get with the secret(s) in the vault."
  type        = list(string)
  default     = []
}

variable "role_definition_ids" {
  description = "Specifies the role id the user will get with the secret(s) in the vault. Usually for custom roles"
  type        = list(string)
  default     = []
}

variable "principal_id" {
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to."
  type        = string
  default     = null
}

variable "application_id" {
  description = "The object ID of an Application in Azure Active Directory."
  type        = string
  default     = null
}