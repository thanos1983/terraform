variable "name" {
  description = "The name of the Container Apps Managed Environment."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Container App Environment is to be created."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the Container App Environment is to exist."
  type        = string
}

variable "dapr_application_insights_connection_string" {
  description = "Application Insights connection string used by Dapr to export Service to Service communication telemetry."
  type        = string
  default     = null
}

variable "infrastructure_subnet_id" {
  description = "The existing Subnet to use for the Container Apps Control Plane."
  type        = string
  default     = null
}

variable "internal_load_balancer_enabled" {
  description = "Should the Container Environment operate in Internal Load Balancing Mode?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.internal_load_balancer_enabled)))
    error_message = "Possible values are true or false."
  }
  default = false
}

variable "zone_redundancy_enabled" {
  description = "Should the Container App Environment be created with Zone Redundancy enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.zone_redundancy_enabled)))
    error_message = "Possible values are true or false."
  }
  default = false
}

variable "log_analytics_workspace_id" {
  description = "The ID for the Log Analytics Workspace to link this Container Apps Managed Environment to."
  type        = string
  default     = null
}

variable "workload_profile_block" {
  description = "The profile of the workload to scope the container app execution."
  type = object({
    name                  = string
    workload_profile_type = optional(string)
    maximum_count         = number
    minimum_count         = number
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
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
