variable "name" {
  description = "Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
  default     = null
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
  default     = null
}

variable "account_kind" {
  description = "Defines the Kind of account."
  type        = string
  validation {
    condition = contains([
      "BlobStorage", "BlockBlobStorage", "FileStorage", "Storage", "StorageV2"
    ], title(var.account_kind))
    error_message = "Kind of account must be \"BlobStorage\", \"BlockBlobStorage\", \"FileStorage\", \"Storage\" or \"Standard_DS2_v2\"."
  }
  default = "StorageV2"
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account."
  type        = string
  validation {
    condition     = contains(["Standard", "Premium"], title(var.account_tier))
    error_message = "Tier must be \"Standard\" or \"Premium\"."
  }
  default = "Standard"
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account."
  type        = string
  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], title(var.account_replication_type))
    error_message = "Type of replication must be \"LRS\", \"GRS\", \"RAGRS\", \"ZRS\", \"GZRS\" or \"RAGZRS\"."
  }
  default = "LRS"
}

variable "cross_tenant_replication_enabled" {
  description = "Should cross Tenant replication be enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.cross_tenant_replication_enabled)))
    error_message = "Tenant replication must be \"true\" or \"false\"."
  }
  default = true
}

variable "access_tier" {
  description = "Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts."
  type        = string
  validation {
    condition     = contains(["Hot", "Cool"], title(var.access_tier))
    error_message = "Access tier must be \"Hot\" or \"Cool\"."
  }
  default = "Hot"
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Storage Account should exist."
  type        = string
  default     = null
}

variable "enable_https_traffic_only" {
  description = "Boolean flag which forces HTTPS if enabled."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enable_https_traffic_only)))
    error_message = "Boolean flag must be \"true\" or \"false\"."
  }
  default = true
}

variable "min_tls_version" {
  description = "The minimum supported TLS version for the storage account."
  type        = string
  validation {
    condition     = contains(["TLS1_0", "TLS1_1", "TLS1_2"], title(var.min_tls_version))
    error_message = "Minimum supported TLS must be \"TLS1_0\", \"TLS1_1\" or \"TLS1_2\"."
  }
  default = "TLS1_2"
}

variable "allow_nested_items_to_be_public" {
  description = "Allow or disallow nested items within this Account to opt into being public."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.allow_nested_items_to_be_public)))
    error_message = "Boolean flag must be \"true\" or \"false\"."
  }
  default = false
}

variable "shared_access_key_enabled" {
  description = "Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.shared_access_key_enabled)))
    error_message = "Boolean flag must be \"true\" or \"false\"."
  }
  default = true
}

variable "public_network_access_enabled" {
  description = "Whether the public network access is enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.public_network_access_enabled)))
    error_message = "Boolean flag must be \"true\" or \"false\"."
  }
  default = false
}

variable "default_to_oauth_authentication" {
  description = "Default to Azure Active Directory authorization in the Azure portal when accessing the Storage Account."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.default_to_oauth_authentication)))
    error_message = "Boolean flag must be \"true\" or \"false\"."
  }
  default = true # to change to false
}

variable "is_hns_enabled" {
  description = "Hierarchical Namespace enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.is_hns_enabled)))
    error_message = "Boolean flag must be \"true\" or \"false\"."
  }
  default = false
}

variable "nfsv3_enabled" {
  description = "Is NFSv3 protocol enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.nfsv3_enabled)))
    error_message = "Boolean flag must be \"true\" or \"false\"."
  }
  default = false
}

variable "custom_domain_block" {
  description = "Custom domain dynamic block."
  type        = object({
    name          = string
    use_subdomain = optional(string)
  })
  default = null
}

variable "customer_managed_key_block" {
  description = "Customer managed keys dynamic block."
  type        = object({
    key_vault_key_id          = string
    user_assigned_identity_id = string
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

variable "blob_properties_block" {
  description = "Customer managed keys dynamic block."
  type        = object({
    cors_rule_block = optional(object({
      allowed_headers    = set(string)
      allowed_methods    = set(string)
      allowed_origins    = set(string)
      exposed_headers    = set(string)
      max_age_in_seconds = number
    }))
    retention_policy_block = optional(object({
      days = optional(number)
    }))
    restore_policy_block = optional(object({
      days = optional(number)
    }))
    versioning_enabled                      = optional(bool)
    change_feed_enabled                     = optional(bool)
    change_feed_retention_in_days           = optional(number)
    default_service_version                 = optional(string)
    last_access_time_enabled                = optional(bool)
    container_delete_retention_policy_block = optional(object({
      days = optional(number)
    }))
  })
  default = null
}

variable "queue_properties_block" {
  description = "Queue properties."
  type        = map(object({
    cors_rule_block = optional(map(object({
      allowed_headers    = set(string)
      allowed_methods    = set(string)
      allowed_origins    = set(string)
      exposed_headers    = set(string)
      max_age_in_seconds = number
    })))
    logging_block = optional(map(object({
      delete                = bool
      read                  = bool
      version               = string
      write                 = bool
      retention_policy_days = optional(number)
    })))
    minute_metrics_block = optional(map(object({
      enabled               = bool
      version               = string
      include_apis          = bool
      retention_policy_days = optional(number)
    })))
    hour_metrics_block = optional(map(object({
      enabled               = bool
      version               = string
      include_apis          = bool
      retention_policy_days = optional(number)
    })))
  }))
  default = null
}

variable "static_website_block" {
  description = "Static website(s)."
  type        = object({
    index_document     = optional(string)
    error_404_document = optional(string)
  })
  default = {
    index_document     = null
    error_404_document = null
  }
}

variable "share_properties_block" {
  description = "Share Properties."
  type        = map(object({
    cors_rule_block = optional(map(object({
      allowed_headers    = set(string)
      allowed_methods    = set(string)
      allowed_origins    = set(string)
      exposed_headers    = set(string)
      max_age_in_seconds = number
    })))
    retention_policy_block = optional(map(object({
      days = optional(number, 7)
    })))
    smb_block = optional(map(object({
      versions                        = optional(string)
      authentication_types            = optional(string)
      kerberos_ticket_encryption_type = optional(string)
      channel_encryption_type         = optional(string)
      multichannel_enabled            = optional(bool, false)
    })))
  }))
  default = null
}

variable "network_rules_block" {
  description = "Networking rule(s)."
  type        = map(object({
    default_action             = string
    bypass                     = optional(set(string))
    ip_rules                   = optional(set(string))
    virtual_network_subnet_ids = optional(set(string))
    private_link_access_block  = optional(map(object({
      endpoint_resource_id = string
      endpoint_tenant_id   = optional(string)
    })))
  }))
  default = null
}

variable "large_file_share_enabled" {
  description = "Large file share enabled."
  type        = bool
  default     = false
}

variable "azure_files_authentication_block" {
  description = "Azure files authentication."
  type        = map(object({
    directory_type         = string
    active_directory_block = optional(object({
      storage_sid         = string
      domain_name         = string
      domain_sid          = string
      domain_guid         = string
      forest_name         = string
      netbios_domain_name = string
    }))
  }))
  default = null
}

variable "routing_block" {
  description = "Routing rule(s)."
  type        = object({
    publish_internet_endpoints  = optional(bool)
    publish_microsoft_endpoints = optional(bool)
    choice                      = optional(string)
  })
  default = {
    publish_internet_endpoints  = false
    publish_microsoft_endpoints = false
    choice                      = "MicrosoftRouting"
  }
}

variable "queue_encryption_key_type" {
  description = "The encryption type of the queue service."
  type        = string
  validation {
    condition     = contains(["Service", "Account"], title(var.queue_encryption_key_type))
    error_message = "Encryption must be \"Service\" or \"Account\"."
  }
  default = "Service"
}

variable "table_encryption_key_type" {
  description = "The encryption type of the table service."
  type        = string
  validation {
    condition     = contains(["Service", "Account"], title(var.table_encryption_key_type))
    error_message = "Encryption must be \"Service\" or \"Account\"."
  }
  default = "Service"
}

variable "infrastructure_encryption_enabled" {
  description = "Is infrastructure encryption enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.infrastructure_encryption_enabled)))
    error_message = "Infrastructure encryption variable must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "immutability_policy_block" {
  description = "Default account-level immutability policy which is inherited and applied to objects."
  type        = object({
    allow_protected_append_writes = bool
    state                         = string
    period_since_creation_in_days = number
  })
  default = null
}

variable "sas_policy_block" {
  description = "Shared Access Signature(s) (SAS)"
  type        = object({
    expiration_period = string
    expiration_action = optional(string)
  })
  default = null
}

variable "allowed_copy_scope" {
  description = "Restrict copy to and from Storage Accounts within an AAD tenant or with Private Links to the same VNet."
  type        = string
  validation {
    condition     = contains(["AAD", "PrivateLink"], var.allowed_copy_scope)
    error_message = "Variable \"allowed_copy_scope\" can be \"AAD\" or \"PrivateLink\"."
  }
  default = "AAD"
}

variable "sftp_enabled" {
  description = "SFTP for Storage Account."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.sftp_enabled)))
    error_message = "Variable \"sftp_enabled\" can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}