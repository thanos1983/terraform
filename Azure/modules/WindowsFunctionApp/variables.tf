variable "location" {
  description = "The Azure Region where the Windows Function App should exist."
  type        = string
}

variable "name" {
  description = "The name which should be used for this Windows Function App."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Windows Function App should exist."
  type        = string
}

variable "service_plan_id" {
  description = "The ID of the App Service Plan within which to create this Function App."
  type        = string
}

variable "site_config_block" {
  description = "A site_config block as defined below."
  type = object({
    always_on                              = optional(bool, false)
    api_definition_url                     = optional(string)
    api_management_api_id                  = optional(string)
    app_command_line                       = optional(string)
    app_scale_limit                        = optional(number)
    application_insights_connection_string = optional(string)
    application_insights_key               = optional(string)
    application_stack_block = optional(object({
      dotnet_version              = optional(string, "v8.0")
      use_dotnet_isolated_runtime = optional(bool)
      java_version                = optional(string)
      node_version                = optional(string)
      powershell_core_version     = optional(string)
      use_custom_runtime          = optional(bool)
    }), null)
    app_service_logs_block = optional(object({
      disk_quota_mb         = optional(number)
      retention_period_days = optional(number)
    }), null)
    cors_block = optional(object({
      allowed_origins     = optional(list(string))
      support_credentials = optional(bool)
    }), null)
    default_documents                 = optional(list(string))
    elastic_instance_minimum          = optional(number)
    ftps_state                        = optional(string)
    health_check_path                 = optional(string)
    health_check_eviction_time_in_min = optional(number)
    http2_enabled                     = optional(bool)
    ip_restriction_blocks = optional(list(object({
      action = optional(string)
      headers_block = optional(object({
        x_azure_fdid      = optional(list(string))
        x_fd_health_probe = optional(list(number))
        x_forwarded_for   = optional(list(string))
        x_forwarded_host  = optional(list(string))
      }), null)
      ip_address                = optional(string)
      name                      = optional(string)
      priority                  = optional(number)
      service_tag               = optional(string)
      virtual_network_subnet_id = optional(string)
    })), [])
    ip_restriction_default_action    = optional(string)
    load_balancing_mode              = optional(string)
    managed_pipeline_mode            = optional(string)
    minimum_tls_version              = optional(string)
    pre_warmed_instance_count        = optional(number)
    remote_debugging_enabled         = optional(bool)
    remote_debugging_version         = optional(string)
    runtime_scale_monitoring_enabled = optional(bool)
    scm_ip_restriction_blocks = optional(list(object({
      action = optional(string)
      headers_block = optional(object({
        x_azure_fdid      = optional(list(string))
        x_fd_health_probe = optional(list(number))
        x_forwarded_for   = optional(list(string))
        x_forwarded_host  = optional(list(string))
      }), null)
      ip_address                = optional(string)
      name                      = optional(string)
      priority                  = optional(number)
      service_tag               = optional(string)
      virtual_network_subnet_id = optional(string)
      description               = optional(string)
    })), [])
    scm_ip_restriction_default_action = optional(string)
    scm_minimum_tls_version           = optional(string)
    scm_use_main_ip_restriction       = optional(bool)
    use_32_bit_worker                 = optional(bool)
    vnet_route_all_enabled            = optional(bool)
    websockets_enabled                = optional(bool)
    worker_count                      = optional(number)
  })
}

variable "app_settings" {
  description = "A map of key-value pairs for App Settings and custom values."
  type        = map(any)
  default     = null
}

variable "auth_settings_block" {
  description = "A auth_settings block as defined below."
  type = object({
    enabled = bool
    active_directory_block = optional(object({
      client_id                  = string
      allowed_audiences          = optional(list(string))
      client_secret              = optional(string)
      client_secret_setting_name = optional(string)
    }), null)
    additional_login_parameters    = optional(map(any))
    allowed_external_redirect_urls = optional(list(string))
    default_provider               = optional(string)
    facebook_block = optional(object({
      app_id                  = string
      app_secret              = optional(string)
      app_secret_setting_name = optional(string)
      oauth_scopes            = optional(list(string))
    }), null)
    github_block = optional(object({
      client_id                  = string
      client_secret              = optional(string)
      client_secret_setting_name = optional(string)
      oauth_scopes               = optional(list(string))
    }), null)
    google_block = optional(object({
      client_id                  = string
      client_secret              = optional(string)
      client_secret_setting_name = optional(string)
      oauth_scopes               = optional(list(string))
    }), null)
    issuer = optional(string)
    microsoft_block = optional(object({
      client_id                  = string
      client_secret              = optional(string)
      client_secret_setting_name = optional(string)
      oauth_scopes               = optional(list(string))
    }), null)
    runtime_version               = optional(string)
    token_refresh_extension_hours = optional(number)
    token_store_enabled           = optional(bool)
    twitter_block = optional(object({
      consumer_key                 = string
      consumer_secret              = optional(string)
      consumer_secret_setting_name = optional(string)
    }), null)
    unauthenticated_client_action = optional(string)
  })
  default = null
}

variable "auth_settings_v2_block" {
  description = "A auth_settings_v2 block as defined below."
  type = object({
    auth_enabled                            = optional(bool)
    runtime_version                         = optional(string)
    config_file_path                        = optional(string)
    require_authentication                  = optional(bool)
    unauthenticated_action                  = optional(string)
    default_provider                        = optional(string)
    excluded_paths                          = optional(list(string))
    http_route_api_prefix                   = optional(string)
    forward_proxy_convention                = optional(string)
    forward_proxy_custom_host_header_name   = optional(string)
    forward_proxy_custom_scheme_header_name = optional(string)
    apple_v2_block = optional(object({
      client_id                  = string
      client_secret_setting_name = string
      login_scopes               = optional(list(string))
    }), null)
    active_directory_v2_block = optional(object({
      client_id                            = string
      tenant_auth_endpoint                 = string
      client_secret_setting_name           = optional(string)
      client_secret_certificate_thumbprint = optional(string)
      jwt_allowed_groups                   = optional(list(string))
      jwt_allowed_client_applications      = optional(list(string))
      www_authentication_disabled          = optional(string)
      allowed_groups                       = optional(list(string))
      allowed_identities                   = optional(list(string))
      allowed_applications                 = optional(list(string))
      login_parameters                     = optional(map(any))
      allowed_audiences                    = optional(list(string))
    }), null)
    azure_static_web_app_v2_block = optional(object({
      client_id = string
    }), null)
    custom_oidc_v2_block = optional(object({
      name                          = string
      client_id                     = string
      openid_configuration_endpoint = optional(string)
      name_claim_type               = optional(string)
      scopes                        = optional(list(string))
      client_credential_method      = optional(string)
      client_secret_setting_name    = optional(string)
      authorisation_endpoint        = optional(string)
      token_endpoint                = optional(string)
      issuer_endpoint               = optional(string)
      certification_uri             = optional(string)
    }), null)
    facebook_v2_block = optional(object({
      app_id                  = string
      app_secret_setting_name = string
      graph_api_version       = optional(string)
      login_scopes            = optional(list(string))
    }), null)
    github_v2_block = optional(object({
      client_id                  = string
      client_secret_setting_name = string
      login_scopes               = optional(list(string))
    }), null)
    google_v2_block = optional(object({
      client_id                  = string
      client_secret_setting_name = string
      allowed_audiences          = optional(list(string))
      login_scopes               = optional(list(string))
    }), null)
    microsoft_v2_block = optional(object({
      client_id                  = string
      client_secret_setting_name = string
      allowed_audiences          = optional(list(string))
      login_scopes               = optional(list(string))
    }), null)
    twitter_v2_block = optional(object({
      consumer_key                 = string
      consumer_secret_setting_name = string
    }), null)
    login_block = optional(object({
      logout_endpoint                   = optional(string)
      token_store_enabled               = optional(string)
      token_refresh_extension_time      = optional(number)
      token_store_path                  = optional(string)
      token_store_sas_setting_name      = optional(string)
      preserve_url_fragments_for_logins = optional(bool)
      allowed_external_redirect_urls    = optional(list(string))
      cookie_expiration_convention      = optional(string)
      cookie_expiration_time            = optional(string)
      validate_nonce                    = optional(bool)
      nonce_expiration_time             = optional(string)
    }), null)
  })
  default = null
}

variable "backup_block" {
  description = "A backup block as defined below."
  type = object({
    name = string
    schedule_block = object({
      frequency_interval       = number
      frequency_unit           = string
      keep_at_least_one_backup = optional(bool)
      retention_period_days    = optional(number)
      start_time               = optional(string)
    })
    storage_account_url = string
    enabled             = optional(bool)
  })
  default = null
}

variable "builtin_logging_enabled" {
  description = "Should built in logging be enabled."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.builtin_logging_enabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
}

variable "client_certificate_enabled" {
  description = "Should the function app use Client Certificates."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.client_certificate_enabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = false
}

variable "client_certificate_mode" {
  description = "The mode of the Function App's client certificates requirement for incoming requests."
  type        = string
  validation {
    condition     = contains(["Required", "OptionalInteractiveUser", "Optional"], title(var.client_certificate_mode))
    error_message = "Possible values can only be \"Required\", \"OptionalInteractiveUser\" or \"Optional\"."
  }
  default = "Optional"
}

variable "client_certificate_exclusion_paths" {
  description = "Paths to exclude when using client certificates, separated by ;"
  type        = string
  default     = null
}

variable "connection_string_blocks" {
  description = "One or more connection_string blocks as defined below."
  type = list(object({
    name  = string
    type  = string
    value = string
  }))
  default = []
}

variable "content_share_force_disabled" {
  description = "Should Content Share Settings be disabled."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.content_share_force_disabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = false
}

variable "daily_memory_time_quota" {
  description = "The amount of memory in gigabyte-seconds that your application is allowed to consume per day."
  type        = number
  default     = 0
}

variable "enabled" {
  description = "Is the Function App enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
}

variable "ftp_publish_basic_authentication_enabled" {
  description = "Should the default FTP Basic Authentication publishing profile be enabled."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.ftp_publish_basic_authentication_enabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
}

variable "functions_extension_version" {
  description = "The runtime version associated with the Function App."
  type        = string
  default     = "~4"
}

variable "https_only" {
  description = "Can the Function App only be accessed via HTTPS?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.https_only)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = false
}

variable "public_network_access_enabled" {
  description = "Should public network access be enabled for the Function App."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.public_network_access_enabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
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

variable "key_vault_reference_identity_id" {
  description = "The User Assigned Identity ID used for accessing KeyVault secrets."
  type        = string
  default     = null
}

variable "storage_account_blocks" {
  description = "One or more storage_account blocks as defined below."
  type = list(object({
    access_key   = string
    account_name = string
    name         = string
    share_name   = string
    type         = string
    mount_path   = optional(string)
  }))
  default = []
}

variable "sticky_settings_block" {
  description = "A sticky_settings block as defined below."
  type = object({
    app_setting_names       = optional(list(string))
    connection_string_names = optional(list(string))
  })
  default = null
}

variable "storage_account_access_key" {
  description = "The access key which will be used to access the backend storage account for the Function App."
  type        = string
  default     = null
}

variable "storage_account_name" {
  description = "The backend storage account name which will be used by this Function App."
  type        = string
  default     = null
}

variable "storage_uses_managed_identity" {
  description = "Should the Function App use Managed Identity to access the storage account."
  type        = bool
  default     = null
}

variable "storage_key_vault_secret_id" {
  description = "The Key Vault Secret ID, optionally including version, that contains the Connection String to connect to the storage account for this Function App."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}

variable "virtual_network_subnet_id" {
  description = "The subnet id which will be used by this Function App for regional virtual network integration."
  type        = string
  default     = null
}

variable "webdeploy_publish_basic_authentication_enabled" {
  description = "Should the default WebDeploy Basic Authentication publishing credentials enabled. Defaults to true."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.webdeploy_publish_basic_authentication_enabled)))
    error_message = "Possible values can only be \"true\" or \"false\"."
  }
  default = true
}

variable "zip_deploy_file" {
  description = "The local path and filename of the Zip packaged application to deploy to this Windows Function App."
  type        = string
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
