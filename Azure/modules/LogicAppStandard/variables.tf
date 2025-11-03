variable "name" {
  description = "Specifies the name of the Logic App Changing this forces a new resource to be created. "
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Logic App."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan within which to create this Logic App."
  type        = string
}

variable "app_settings" {
  description = "A map of key-value pairs for App Settings and custom values."
  type        = map(string)
  default     = null
}

variable "use_extension_bundle" {
  description = "Should the logic app use the bundled extension package?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.use_extension_bundle)))
    error_message = "The variable must be 'true' or 'false'."
  }
  default = true
}

variable "bundle_version" {
  description = "If use_extension_bundle then controls the allowed range for bundle versions."
  type        = string
  default     = null
}

variable "connection_string_block" {
  description = "A connection_string block as defined below."
  type        = object({
    name  = string
    type  = string
    value = string
  })
  default = null
}

variable "identity_block" {
  description = "An identity block as defined below."
  type        = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = {
    type = "SystemAssigned"
  }
}

variable "site_config_block" {
  description = "A site_config object as defined below."
  type        = object({
    always_on       = optional(bool)
    app_scale_limit = optional(number)
    cors_block      = optional(object({
      allowed_origins     = list(string)
      support_credentials = optional(bool)
    }), null)
    dotnet_framework_version = optional(string)
    elastic_instance_minimum = optional(string)
    ftps_state               = optional(string)
    health_check_path        = optional(string)
    http2_enabled            = optional(bool)
    ip_restriction_blocks    = optional(list(object({
      ip_address                = optional(string)
      service_tag               = optional(string)
      virtual_network_subnet_id = optional(string)
      name                      = optional(string)
      priority                  = optional(number)
      action                    = optional(string)
      headers_block             = optional(object({
        x_azure_fdid      = optional(list(string))
        x_fd_health_probe = optional(list(string))
        x_forwarded_for   = optional(list(string))
        x_forwarded_host  = optional(list(string))
      }), null)
    })), [])
    scm_ip_restriction_blocks = optional(list(object({
      ip_address                = optional(string)
      service_tag               = optional(string)
      virtual_network_subnet_id = optional(string)
      name                      = optional(string)
      priority                  = optional(number)
      action                    = optional(string)
      headers_block             = optional(object({
        x_azure_fdid      = optional(list(string))
        x_fd_health_probe = optional(list(string))
        x_forwarded_for   = optional(list(string))
        x_forwarded_host  = optional(list(string))
      }), null)
    })))
    scm_use_main_ip_restriction      = optional(bool)
    scm_min_tls_version              = optional(string)
    scm_type                         = optional(string)
    linux_fx_version                 = optional(string)
    min_tls_version                  = optional(string)
    pre_warmed_instance_count        = optional(number)
    runtime_scale_monitoring_enabled = optional(bool)
    use_32_bit_worker_process        = optional(bool)
    vnet_route_all_enabled           = optional(bool)
    websockets_enabled               = optional(bool)
  })
  default = null
}

variable "client_affinity_enabled" {
  description = "Should the Logic App send session affinity cookies, which route client requests in the same session to the same instance?"
  type        = bool
  default     = null
}

variable "client_certificate_mode" {
  description = "The mode of the Logic App's client certificates requirement for incoming requests."
  type        = string
  validation {
    condition     = contains(["Required", "Optional"], title(var.client_certificate_mode))
    error_message = "The variable must be 'Required' or 'Optional'."
  }
  default = "Optional"
}

variable "enabled" {
  description = "Is the Logic App enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enabled)))
    error_message = "The variable must be 'true' or 'false'."
  }
  default = true
}

variable "https_only" {
  description = "Can the Logic App only be accessed via HTTPS?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.https_only)))
    error_message = "The variable must be 'true' or 'false'."
  }
  default = false
}

variable "storage_account_name" {
  description = "The backend storage account name which will be used by this Logic App (e.g. for Stateful workflows data)."
  type        = string
}

variable "storage_account_access_key" {
  description = "The access key which will be used to access the backend storage account for the Logic App."
  type        = string
}

variable "storage_account_share_name" {
  description = "The name of the share used by the logic app, if you want to use a custom name."
  type        = string
  default     = null
}

variable "logic_app_version" {
  description = "The runtime version associated with the Logic App."
  type        = string
  default     = "~3"
}

variable "virtual_network_subnet_id" {
  description = "The subnet id which will be used by this resource for regional virtual network integration."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}