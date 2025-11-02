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

variable "application_type" {
  description = "Specifies the type of Application Insights to create."
  type        = string
}

variable "daily_data_cap_in_gb" {
  description = "Specifies the Application Insights component daily data volume cap in GB."
  type        = string
  default     = null
}

variable "daily_data_cap_notifications_disabled" {
  description = "Specifies if a notification email will be send when the daily data volume cap is met."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.daily_data_cap_notifications_disabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "retention_in_days" {
  description = "Specifies the retention period in days."
  type        = string
  validation {
    condition     = contains(["30", "60", "90", "120", "270", "365", "550", "730"], tostring(var.retention_in_days))
    error_message = "Possible values can be \"30\", \"60\", \"90\", \"120\", \"270\", \"365\", \"550\" or \"730\"."
  }
  default = "90"
}

variable "sampling_percentage" {
  description = "Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry."
  type        = number
  default     = 100
}

variable "disable_ip_masking" {
  description = "Use this argument to disable masking and log the real client IP."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.disable_ip_masking)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "workspace_id" {
  description = "Specifies the id of a log analytics workspace resource."
  type        = string
  default     = null
}

variable "local_authentication_disabled" {
  description = "Disable Non-Azure AD based Auth."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.local_authentication_disabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "internet_ingestion_enabled" {
  description = "Should the Application Insights component support ingestion over the Public Internet?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.internet_ingestion_enabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "internet_query_enabled" {
  description = "Should the Application Insights component support querying over the Public Internet?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.internet_query_enabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "force_customer_storage_for_profiler" {
  description = "Should the Application Insights component force users to create their own storage account for profiling?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.force_customer_storage_for_profiler)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
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
