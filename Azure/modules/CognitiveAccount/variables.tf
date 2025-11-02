variable "name" {
  description = "The name for this Container App."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where this Public IP should exist."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "kind" {
  description = "Specifies the type of Cognitive Service Account that should be created."
  type        = string
}

variable "sku_name" {
  description = "Specifies the SKU Name for this Cognitive Service Account."
  type        = string
}

variable "custom_subdomain_name" {
  description = "The subdomain name used for token-based authentication."
  type        = string
  default     = null
}

variable "dynamic_throttling_enabled" {
  description = "Whether to enable the dynamic throttling for this Cognitive Service Account."
  type        = string
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.dynamic_throttling_enabled)))
    error_message = "Parameter must be 'true' or 'false'."
  }
  default = false
}

variable "customer_managed_key_block" {
  description = "A customer_managed_key block as documented below."
  type = object({
    key_vault_key_id   = string
    identity_client_id = optional(string)
  })
  default = null
}

variable "fqdns" {
  description = "List of FQDNs allowed for the Cognitive Account."
  type        = list(string)
  default     = []
}

variable "identity_block" {
  description = "An identity block as defined below."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = {
    type = "SystemAssigned"
  }
}

variable "local_auth_enabled" {
  description = "Whether local authentication methods is enabled for the Cognitive Account."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.local_auth_enabled)))
    error_message = "Parameter must be 'true' or 'false'."
  }
  default = true
}

variable "metrics_advisor_aad_client_id" {
  description = "The Azure AD Client ID (Application ID)."
  type        = string
  default     = null
}

variable "metrics_advisor_aad_tenant_id" {
  description = "The Azure AD Tenant ID."
  type        = string
  default     = null
}

variable "metrics_advisor_super_user_name" {
  description = "The super user of Metrics Advisor."
  type        = string
  default     = null
}

variable "metrics_advisor_website_name" {
  description = "The website name of Metrics Advisor."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
}

variable "network_acls_block" {
  description = "A network_acls block as defined below."
  type = object({
    default_action = string
    ip_rules       = optional(list(string))
    virtual_network_rules_blocks = optional(list(object({
      subnet_id                            = string
      ignore_missing_vnet_service_endpoint = optional(bool, false)
    })), [])
  })
  default = null
}

variable "outbound_network_access_restricted" {
  description = "Whether outbound network access is restricted for the Cognitive Account."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.outbound_network_access_restricted)))
    error_message = "Parameter must be 'true' or 'false'."
  }
  default = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for the Cognitive Account."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.public_network_access_enabled)))
    error_message = "Parameter must be 'true' or 'false'."
  }
  default = false
}

variable "qna_runtime_endpoint" {
  description = "A URL to link a QnAMaker cognitive account to a QnA runtime."
  type        = string
  default     = null
}

variable "custom_question_answering_search_service_id" {
  description = "If kind is TextAnalytics this specifies the ID of the Search service."
  type        = string
  default     = null
}

variable "custom_question_answering_search_service_key" {
  description = "If kind is TextAnalytics this specifies the key of the Search service."
  type        = string
  default     = null
}

variable "storage_blocks" {
  description = "A storage block as defined below."
  type = list(object({
    storage_account_id = string
    identity_client_id = optional(string)
  }))
  default = []
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

variable "key_vault_id" {
  description = "The key vault ID for the vault."
  type        = string
  default     = null
}

variable "secret_permissions" {
  description = "List of secret permissions."
  type        = list(string)
  default     = []
}

variable "principal_id" {
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to."
  type        = string
  default     = null
}
