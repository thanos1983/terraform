variable "name" {
  description = "Specifies the name of the network security group."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "location" {
  description = "The name of the resource group in which to create the network security group."
  type        = string
}

variable "allow_resource_only_permissions" {
  description = "Specifies if the log Analytics Workspace allow users accessing to data associated with resources they have permission to view, without permission to workspace."
  type        = bool
  validation {
    condition = contains([
      "true", "false"
    ], lower(tostring(var.allow_resource_only_permissions)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = false
}

variable "local_authentication_disabled" {
  description = "Specifies if the log Analytics workspace should enforce authentication using Azure AD."
  type        = bool
  validation {
    condition = contains([
      "true", "false"
    ], lower(tostring(var.local_authentication_disabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = false
}

variable "sku" {
  description = "Specifies the SKU of the Log Analytics Workspace."
  type        = string
  validation {
    condition = contains([
      "Free", "PerNode", "Premium", "Standard", "Standalone", "Unlimited", "CapacityReservation", "PerGB2018"
    ], title(var.sku))
    error_message = "Possible values can only be \"Free\", \"PerNode\", \"Premium\", \"Standard\", \"Standalone\", \"Unlimited\", \"CapacityReservation\" and \"PerGB2018\"."
  }
  default = "PerGB2018"
}

variable "retention_in_days" {
  description = "The workspace data retention in days."
  type        = number
  validation {
    condition = (
      var.retention_in_days >= 30 &&
      var.retention_in_days <= 730
    )
    error_message = "Possible values can only be between \"30\" and \"730\"."
  }
  default = 30
}

variable "daily_quota_gb" {
  description = "The workspace daily quota for ingestion in GB."
  type        = string
  default     = "0.5"
}

variable "cmk_for_query_forced" {
  description = "Is Customer Managed Storage mandatory for query management?"
  type        = string
  default     = null
}

variable "internet_ingestion_enabled" {
  description = "Should the Log Analytics Workspace support querying over the Public Internet?"
  type        = bool
  validation {
    condition = contains([
      "true", "false"
    ], lower(tostring(var.internet_ingestion_enabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
}

variable "internet_query_enabled" {
  description = "Should the Log Analytics Workspace support querying over the Public Internet?"
  type        = bool
  validation {
    condition = contains([
      "true", "false"
    ], lower(tostring(var.internet_query_enabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
}

variable "reservation_capacity_in_gb_per_day" {
  description = "The capacity reservation level in GB for this workspace."
  type        = number
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
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