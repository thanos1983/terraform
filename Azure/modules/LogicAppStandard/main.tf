resource "azurerm_logic_app_standard" "logic_app_standard" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  location             = var.location
  app_service_plan_id  = var.app_service_plan_id
  app_settings         = var.app_settings
  use_extension_bundle = var.use_extension_bundle
  bundle_version       = var.bundle_version

  dynamic "connection_string" {
    for_each = var.connection_string_block[*]
    content {
      name  = connection_string.value.name
      type  = connection_string.value.type
      value = connection_string.value.value
    }
  }

  client_affinity_enabled = var.client_affinity_enabled
  client_certificate_mode = var.client_certificate_mode
  enabled                 = var.enabled
  https_only              = var.https_only

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "site_config" {
    for_each = var.site_config_block[*]
    content {
      always_on       = site_config.value.always_on
      app_scale_limit = site_config.value.app_scale_limit
      dynamic "cors" {
        for_each = site_config.value.cors_block[*]
        content {
          allowed_origins     = cors.value.allowed_origins
          support_credentials = cors.value.support_credentials
        }
      }
      dotnet_framework_version = site_config.value.app_scale_limit
      elastic_instance_minimum = site_config.value.elastic_instance_minimum
      ftps_state               = site_config.value.ftps_state
      health_check_path        = site_config.value.health_check_path
      http2_enabled            = site_config.value.http2_enabled
      dynamic "ip_restriction" {
        for_each = site_config.value.ip_restriction_blocks
        content {
          ip_address                = ip_restriction.value.ip_address
          service_tag               = ip_restriction.value.service_tag
          virtual_network_subnet_id = ip_restriction.value.virtual_network_subnet_id
          name                      = ip_restriction.value.name
          priority                  = ip_restriction.value.priority
          action                    = ip_restriction.value.action
          dynamic "headers" {
            for_each = ip_restriction.value.headers_block[*]
            content {
              x_azure_fdid      = headers.value.x_azure_fdid
              x_fd_health_probe = headers.value.x_fd_health_probe
              x_forwarded_for   = headers.value.x_forwarded_for
              x_forwarded_host  = headers.value.x_forwarded_host
            }
          }
        }
      }
      dynamic "scm_ip_restriction" {
        for_each = site_config.value.scm_ip_restriction_blocks
        content {
          ip_address                = scm_ip_restriction.value.ip_address
          service_tag               = scm_ip_restriction.value.service_tag
          virtual_network_subnet_id = scm_ip_restriction.value.virtual_network_subnet_id
          name                      = scm_ip_restriction.value.name
          priority                  = scm_ip_restriction.value.priority
          action                    = scm_ip_restriction.value.action
          dynamic "headers" {
            for_each = scm_ip_restriction.value.headers_block[*]
            content {
              x_azure_fdid      = headers.value.x_azure_fdid
              x_fd_health_probe = headers.value.x_fd_health_probe
              x_forwarded_for   = headers.value.x_forwarded_for
              x_forwarded_host  = headers.value.x_forwarded_host
            }
          }
        }
      }
      scm_use_main_ip_restriction      = site_config.value.scm_use_main_ip_restriction
      scm_min_tls_version              = site_config.value.scm_min_tls_version
      scm_type                         = site_config.value.scm_type
      linux_fx_version                 = site_config.value.linux_fx_version
      min_tls_version                  = site_config.value.min_tls_version
      pre_warmed_instance_count        = site_config.value.pre_warmed_instance_count
      runtime_scale_monitoring_enabled = site_config.value.runtime_scale_monitoring_enabled
      use_32_bit_worker_process        = site_config.value.use_32_bit_worker_process
      vnet_route_all_enabled           = site_config.value.vnet_route_all_enabled
      websockets_enabled               = site_config.value.websockets_enabled
    }
  }

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  storage_account_share_name = var.storage_account_share_name
  version                    = var.logic_app_version
  virtual_network_subnet_id  = var.virtual_network_subnet_id
  tags                       = var.tags
}
