variable "container_app_environment_id" {
  description = "The ID of the Container App Managed Environment for this Dapr Component."
  type        = string
}

variable "name" {
  description = "The name for this Dapr component. Changing this forces a new resource to be created."
  type        = string
}

variable "component_type" {
  description = "The Dapr Component Type. For example state.azure.blobstorage."
  type        = string
}

variable "dapr_component_version" {
  description = "The version of the component."
  type        = string
}

variable "ignore_errors" {
  description = "Should the Dapr sidecar to continue initialisation if the component fails to load."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.ignore_errors)))
    error_message = "Possible values are true or false."
  }
  default = false
}

variable "init_timeout" {
  description = "The timeout for component initialisation as a ISO8601 formatted string."
  type        = string
  default     = "5s"
}

variable "metadata_blocks" {
  description = "One or more metadata blocks as detailed below."
  type        = list(object({
    name        = string
    secret_name = optional(string)
    value       = optional(string)
  }))
  default = []
}

variable "scopes" {
  description = "A list of scopes to which this component applies."
  type        = list(string)
  default     = []
}

variable "secret_block" {
  description = "A secret block as detailed below."
  type        = object({
    name  = string
    value = string
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type        = object({
    create = optional(number, 30)
    read   = optional(number, 5)
    update = optional(number, 30)
    delete = optional(number, 30)
  })
  default = null
}