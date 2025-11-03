resource "kubernetes_ingress_v1" "ingress_v1" {
  dynamic "metadata" {
    for_each = var.metadata_block[*]
    content {
      annotations   = metadata.value.annotations
      generate_name = metadata.value.generate_name
      labels        = metadata.value.labels
      name          = metadata.value.name
      namespace     = metadata.value.namespace
    }
  }

  dynamic "spec" {
    for_each = var.spec_block[*]
    content {
      dynamic "default_backend" {
        for_each = spec.value.default_backend_block[*]
        content {
          dynamic "resource" {
            for_each = default_backend.value.resource_block[*]
            content {
              kind      = resource.value.kind
              name      = resource.value.name
              api_group = resource.value.api_group
            }
          }
          dynamic "service" {
            for_each = default_backend.value.service_block[*]
            content {
              name = service.value.name
              dynamic "port" {
                for_each = service.value.port_block[*]
                content {
                  name   = port.value.name
                  number = port.value.number
                }
              }
            }
          }
        }
      }

      ingress_class_name = spec.value.ingress_class_name

      dynamic "rule" {
        for_each = spec.value.rule_blocks
        content {
          host = rule.value.host
          dynamic "http" {
            for_each = rule.value.http_blocks
            content {
              dynamic "path" {
                for_each = http.value.path_blocks
                content {
                  path      = path.value.path
                  path_type = path.value.path_type
                  dynamic "backend" {
                    for_each = path.value.backend_block[*]
                    content {
                      dynamic "resource" {
                        for_each = backend.value.resource_block[*]
                        content {
                          kind      = resource.value.kind
                          name      = resource.value.name
                          api_group = resource.value.api_group
                        }
                      }
                      dynamic "service" {
                        for_each = backend.value.service_block[*]
                        content {
                          name = service.value.name
                          dynamic "port" {
                            for_each = service.value.port_block[*]
                            content {
                              name   = port.value.name
                              number = port.value.number
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      dynamic "tls" {
        for_each = spec.value.tls_blocks
        content {
          hosts       = tls.value.hosts
          secret_name = tls.value.secret_name
        }
      }
    }
  }
}
