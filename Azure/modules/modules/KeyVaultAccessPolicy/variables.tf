variable "key_vault_id" {
  description = "Specifies the id of the Key Vault resource."
  type        = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
  type        = string
}

variable "object_id" {
  description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault."
  type        = string
}

variable "application_id" {
  description = "The object ID of an Application in Azure Active Directory."
  type        = string
  default     = null
}

variable "certificate_permissions" {
  description = "List of certificate permissions."
  type        = set(string)
  validation {
    condition = alltrue([
      for certificate_permission in var.certificate_permissions : contains([
        "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers",
        "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"
      ], certificate_permission)
    ])
    error_message = "Parameter cam be one or combination of \"Backup\", \"Create\", \"Delete\", \"DeleteIssuers\", \"Get\", \"GetIssuers\", \"Import\", \"List\", \"ListIssuers\", \"ManageContacts\", \"ManageIssuers\", \"Purge\", \"Recover\", \"Restore\", \"SetIssuers\", \"Update\"."
  }
  default = ["Get"]
}

variable "key_permissions" {
  description = "List of certificate permissions."
  type        = set(string)
  validation {
    condition = alltrue([
      for key_permission in var.key_permissions : contains([
        "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore",
        "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "ManageContacts", "ManageIssuers",
        "SetIssuers", "GetRotationPolicy", "SetRotationPolicy"
      ], key_permission)
    ])
    error_message = "Parameter cam be one or combination of \"Backup\", \"Create\", \"Decrypt\", \"Delete\", \"Encrypt\", \"Get\", \"Import\", \"List\", \"Purge\", \"Recover\", \"Restore\", \"Sign\", \"UnwrapKey\", \"Update\", \"Verify\", \"WrapKey\", \"Release\", \"Rotate\", \"GetRotationPolicy\" and \"SetRotationPolicy\"."
  }
  default = ["Get"]
}

variable "secret_permissions" {
  description = "List of secret permissions."
  type        = set(string)
  validation {
    condition = alltrue([
      for secret_permission in var.secret_permissions : contains([
        "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
      ], secret_permission)
    ])
    error_message = "Parameter cam be one or combination of \"Backup\", \"Delete\", \"Get\", \"List\", \"Purge\", \"Recover\", \"Restore\" and \"Set\"."
  }
  default = ["Get"]
}

variable "storage_permissions" {
  description = "List of storage permissions."
  type        = set(string)
  validation {
    condition = alltrue([
      for storage_permission in var.storage_permissions : contains([
        "Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey",
        "Restore", "Set", "SetSAS", "Update"
      ], storage_permission)
    ])
    error_message = "Parameter cam be one or combination of \"Backup\", \"Delete\", \"DeleteSAS\", \"Get\", \"GetSAS\", \"List\", \"ListSAS\", \"Purge\", \"Recover\", \"RegenerateKey\", \"Restore\", \"Set\", \"SetSAS\", \"Update\"."
  }
  default = ["Get"]
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    read   = optional(number, 30)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}