variable "name" {
  description = "Specifies the name of the Data Factory."
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

variable "access_policy_block" {
  description = "A list of objects up to 1024 objects describing access policies, as described below."
  type        = object({
    tenant_id               = string
    object_id               = string
    application_id          = optional(string)
    certificate_permissions = optional(set(string))
    key_permissions         = optional(set(string))
    secret_permissions      = optional(set(string))
    storage_permissions     = optional(set(string))
  })
  default = null
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
  type        = map(object({
    bypass                     = string
    default_action             = string
    ip_rules                   = optional(set(string))
    virtual_network_subnet_ids = optional(set(string))
  }))
  default = {}
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
  default = false
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