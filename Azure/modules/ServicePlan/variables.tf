variable "name" {
  description = "The name which should be used for this Service Plan."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Service Plan should exist."
  type        = string
}

variable "os_type" {
  description = "The O/S type for the App Services to be hosted in this plan."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Service Plan should exist."
  type        = string
}

variable "sku_name" {
  description = "The SKU for the plan."
  type        = string
}

variable "app_service_environment_id" {
  description = "The ID of the App Service Environment to create this Service Plan in."
  type        = string
  default     = null
}

variable "maximum_elastic_worker_count" {
  description = "The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU."
  type        = string
  default     = null
}

variable "worker_count" {
  description = "The number of Workers (instances) to be allocated."
  type        = string
  default     = null
}

variable "per_site_scaling_enabled" {
  description = "Should Per Site Scaling be enabled."
  type        = bool
  default     = false
}

variable "zone_balancing_enabled" {
  description = "Should the Service Plan balance across Availability Zones in the region."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the AppService."
  type        = map(string)
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number)
    read   = optional(number)
    update = optional(number)
    delete = optional(number)
  })
  default = null
}
