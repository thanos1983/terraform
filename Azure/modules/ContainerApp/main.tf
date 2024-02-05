resource "azurerm_container_app" "container_app" {
  container_app_environment_id = var.container_app_environment_id
  name                         = var.name
  resource_group_name          = var.resource_group_name
  revision_mode                = var.revision_mode
  dynamic "template" {
    for_each = var.template_block
    content {
      container = template.value.container
      dynamic "init_container" {
        for_each = template.value.init_container
        content {
          args              = init_container.value.args
          command           = init_container.value.command
          cpu               = init_container.value.cpu
          env               = init_container.value.env
          ephemeral_storage = init_container.value.ephemeral_storage
          image             = init_container.value.image
          memory            = init_container.value.memory
          name              = init_container.value.name
          dynamic "volume_mounts" {
            for_each = init_container.value.volume_mounts
            content {
              name = volume_mounts.value.name
              path = volume_mounts.value.path
            }
          }
        }
      }
      dynamic "container" {
        for_each = template.value.container
        content {
          args              = container.value.args
          command           = container.value.command
          cpu               = container.value.cpu
          env               = container.value.env
          ephemeral_storage = container.value.ephemeral_storage
          image             = container.value.image
          dynamic "liveness_probe" {
            for_each = container.value.liveness_probe
            content {
              failure_count_threshold = liveness_probe.value.failure_count_threshold
              dynamic "header" {
                for_each = liveness_probe.value.header
                content {
                  name  = header.value.name
                  value = header.value.value
                }
              }
              host                             = liveness_probe.value.host
              initial_delay                    = liveness_probe.value.initial_delay
              interval_seconds                 = liveness_probe.value.interval_seconds
              path                             = liveness_probe.value.path
              port                             = liveness_probe.value.port
              termination_grace_period_seconds = liveness_probe.value.termination_grace_period_seconds
              timeout                          = liveness_probe.value.timeout
              transport                        = liveness_probe.value.transport
            }
          }
          memory = container.value.memory
          name   = container.value.name
          dynamic "readiness_probe" {
            for_each = container.value.readiness_probe
            content {
              failure_count_threshold = readiness_probe.value.failure_count_threshold
              dynamic "header" {
                for_each = readiness_probe.value.header
                content {
                  name  = header.value.name
                  value = header.value.value
                }
              }
              host                    = readiness_probe.value.host
              interval_seconds        = readiness_probe.value.interval_seconds
              path                    = readiness_probe.value.path
              port                    = readiness_probe.value.port
              success_count_threshold = readiness_probe.value.success_count_threshold
              timeout                 = readiness_probe.value.timeout
              transport               = readiness_probe.value.transport
            }
          }
          dynamic "startup_probe" {
            for_each = container.value.startup_probe
            content {
              failure_count_threshold = startup_probe.value.failure_count_threshold
              dynamic "header" {
                for_each = startup_probe.value.header
                content {
                  name  = header.value.name
                  value = header.value.value
                }
              }
              host                             = startup_probe.value.host
              interval_seconds                 = startup_probe.value.interval_seconds
              path                             = startup_probe.value.path
              port                             = startup_probe.value.port
              termination_grace_period_seconds = startup_probe.value.termination_grace_period_seconds
              timeout                          = startup_probe.value.timeout
              transport                        = startup_probe.value.transport
            }
          }
          dynamic "volume_mounts" {
            for_each = container.value.volume_mounts
            content {
              name = volume_mounts.value.name
              path = volume_mounts.value.path
            }
          }
        }
      }
      max_replicas = template.value.max_replicas
      min_replicas = template.value.min_replicas
      dynamic "azure_queue_scale_rule" {
        for_each = template.value.azure_queue_scale_rule
        content {
          name         = azure_queue_scale_rule.value.name
          queue_name   = azure_queue_scale_rule.value.queue_name
          queue_length = azure_queue_scale_rule.value.queue_length
          dynamic "authentication" {
            for_each = azure_queue_scale_rule.value.authentication
            content {
              secret_name       = authentication.value.secret_name
              trigger_parameter = authentication.value.trigger_parameter
            }
          }
        }
      }
      dynamic "custom_scale_rule" {
        for_each = template.value.custom_scale_rule
        content {
          name             = custom_scale_rule.value.name
          custom_rule_type = custom_scale_rule.value.custom_rule_type
          metadata         = custom_scale_rule.value.metadata
          dynamic "authentication" {
            for_each = custom_scale_rule.value.authentication
            content {
              secret_name       = authentication.value.secret_name
              trigger_parameter = authentication.value.trigger_parameter
            }
          }
        }
      }
      dynamic "http_scale_rule" {
        for_each = template.value.http_scale_rule
        content {
          concurrent_requests = http_scale_rule.value.concurrent_requests
          name                = http_scale_rule.value.name
        }
        dynamic "authentication" {
          for_each = http_scale_rule.value.authentication
          content {
            secret_name       = authentication.value.secret_name
            trigger_parameter = authentication.value.trigger_parameter
          }
        }
      }
      dynamic "tcp_scale_rule" {
        for_each = template.value.tcp_scale_rule
        content {
          concurrent_requests = tcp_scale_rule.value.concurrent_requests
          name                = tcp_scale_rule.value.name
          dynamic "authentication" {
            for_each = tcp_scale_rule.value.authentication
            content {
              secret_name       = authentication.value.secret_name
              trigger_parameter = authentication.value.trigger_parameter
            }
          }
        }
      }
      revision_suffix = template.value.revision_suffix
      dynamic "volume" {
        for_each = template.value.volume
        content {
          name         = volume.value.name
          storage_name = volume.value.storage_name
          storage_type = volume.value.storage_type
        }
      }
    }
  }

  dynamic "dapr" {
    for_each = var.dapr_block[*]
    content {
      app_id       = dapr.value.app_id
      app_port     = dapr.value.app_port
      app_protocol = dapr.value.app_protocol
    }
  }

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "ingress" {
    for_each = var.ingress_block[*]
    content {
      allow_insecure_connections = ingress.value.allow_insecure_connections
      dynamic "custom_domain" {
        for_each = ingress.value.custom_domain_blocks
        content {
          certificate_binding_type = custom_domain.value.certificate_binding_type
          certificate_id           = custom_domain.value.certificate_id
          name                     = custom_domain.value.name
        }
      }
      fqdn             = ingress.value.fqdn
      external_enabled = ingress.value.external_enabled
      dynamic "ip_security_restriction" {
        for_each = ingress.value.ip_security_restriction_blocks
        content {
          action           = ip_security_restriction.value.action
          description      = ip_security_restriction.value.description
          ip_address_range = ip_security_restriction.value.ip_address_range
          name             = ip_security_restriction.value.name
        }
      }
      target_port  = ingress.value.target_port
      exposed_port = ingress.value.exposed_port
      dynamic "traffic_weight" {
        for_each = ingress.value.traffic_weight_blocks
        content {
          label           = traffic_weight.value.label
          latest_revision = traffic_weight.value.latest_revision
          revision_suffix = traffic_weight.value.revision_suffix
          percentage      = traffic_weight.value.percentage
        }
      }
      transport = ingress.value.transport
    }
  }

  dynamic "registry" {
    for_each = var.registry_block[*]
    content {
      server               = registry.value.server
      identity             = registry.value.identity
      password_secret_name = registry.value.password_secret_name
      username             = registry.value.username
    }
  }

  dynamic "secret" {
    for_each = var.secret_blocks
    content {
      name  = secret.value.name
      value = secret.value.value
    }
  }

  workload_profile_name = var.workload_profile_name
  tags                  = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}