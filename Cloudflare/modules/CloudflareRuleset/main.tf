resource "cloudflare_ruleset" "ruleset" {
  kind        = var.kind
  name        = var.name
  phase       = var.phase
  account_id  = var.account_id
  description = var.description

  dynamic "rules" {
    for_each = var.rules_block
    content {
      expression = rules.value.expression
      action     = rules.value.action

      dynamic "action_parameters" {
        for_each = rules.value.action_parameters_block
        content {
          additional_cacheable_ports = action_parameters.value.additional_cacheable_ports
          dynamic "algorithms" {
            for_each = action_parameters.value.algorithms_blocks
            content {
              name = algorithms.value.name
            }
          }
          automatic_https_rewrites = action_parameters.value.automatic_https_rewrites
          dynamic "autominify" {
            for_each = action_parameters.value.autominify_block
            content {
              css  = autominify.value.css
              html = autominify.value.html
              js   = autominify.value.js
            }
          }
          bic = action_parameters.value.bic
          dynamic "browser_ttl" {
            for_each = action_parameters.value.browser_ttl_block
            content {
              mode    = browser_ttl.value.mode
              default = browser_ttl.value.default
            }
          }
          cache = action_parameters.value.cache
          dynamic "cache_key" {
            for_each = action_parameters.value.cache_key_block
            content {
              cache_by_device_type  = cache_key.value.cache_by_device_type
              cache_deception_armor = cache_key.value.cache_deception_armor
              dynamic "custom_key" {
                for_each = cache_key.value.custom_key_block
                content {
                  dynamic "cookie" {
                    for_each = cache_key.value.cookie_block
                    content {
                      check_presence = cookie.value.check_presence
                      include        = cookie.value.include
                    }
                  }
                  dynamic "header" {
                    for_each = cache_key.value.header_block
                    content {
                      check_presence = header.value.check_presence
                      exclude_origin = header.value.exclude_origin
                      include        = header.value.include
                    }
                  }
                  dynamic "host" {
                    for_each = cache_key.value.host_block
                    content {
                      resolved = host.value.resolved
                    }
                  }
                  dynamic "query_string" {
                    for_each = cache_key.value.query_string_block
                    content {
                      exclude = query_string.value.exclude
                      include = query_string.value.include
                    }
                  }
                  dynamic "user" {
                    for_each = cache_key.value.user_block
                    content {
                      device_type = user.value.device_type
                      geo         = user.value.geo
                      lang        = user.value.lang
                    }
                  }
                }
              }
              ignore_query_strings_order = cache_key.value.ignore_query_strings_order
            }
          }
          content         = action_parameters.value.content
          content_type    = action_parameters.value.content_type
          cookie_fields   = action_parameters.value.cookie_fields
          disable_apps    = action_parameters.value.disable_apps
          disable_railgun = action_parameters.value.disable_railgun
          disable_rum     = action_parameters.value.disable_rum

          dynamic "edge_ttl" {
            for_each = action_parameters.value.edge_ttl_block
            content {
              mode    = edge_ttl.value.mode
              default = edge_ttl.value.default

              dynamic "status_code_ttl" {
                for_each = action_parameters.value.status_code_ttl_block
                content {
                  status_code = status_code_ttl.value.status_code
                  dynamic "status_code_range" {
                    for_each = status_code_ttl.value.status_code_range_block
                    content {
                      from = status_code_range.value.from
                      to   = status_code_range.value.to
                    }
                  }
                  value = status_code_ttl.value.value
                }
              }
            }
          }
          email_obfuscation = action_parameters.value.email_obfuscation
          fonts             = action_parameters.value.fonts
          dynamic "from_list" {
            for_each = action_parameters.value.from_list_block
            content {
              key  = from_list.value.key
              name = from_list.value.name
            }
          }
          dynamic "from_value" {
            for_each = action_parameters.value.from_value_block
            content {
              preserve_query_string = from_value.value.preserve_query_string
              status_code           = from_value.value.status_code
              dynamic "target_url" {
                for_each = from_value.value.target_url_block
                content {
                  expression = target_url.value.expression
                  value      = target_url.value.value
                }
              }
            }
          }

          dynamic "headers" {
            for_each = action_parameters.value.headers_block
            content {
              expression = headers.value.expression
              name       = headers.value.name
              operation  = headers.value.operation
              value      = headers.value.value
            }
          }

          host_header        = action_parameters.value.host_header
          hotlink_protection = action_parameters.value.hotlink_protection
          id                 = action_parameters.value.id
          increment          = action_parameters.value.increment

          dynamic "matched_data" {
            for_each = action_parameters.value.matched_data_block
            content {
              public_key = matched_data.value.public_key
            }
          }

          mirage                   = action_parameters.value.mirage
          opportunistic_encryption = action_parameters.value.opportunistic_encryption
        }
      }
    }
  }

  #   dynamic "" {
  #     for_each = ""
  #     content {}
  #   }

  rules {
    expression = ""
    action_parameters {
      origin {
        host = ""
        port = ""
      }

      origin_cache_control       = ""
      origin_error_page_passthru = ""

      overrides {
        action = ""

        categories {
          action   = ""
          category = ""
          enabled  = ""
        }

        enabled = ""

        rules {
          action            = ""
          enabled           = ""
          id                = ""
          score_threshold   = ""
          sensitivity_level = ""
        }

        sensitivity_level = ""
      }

      phases               = []
      polish               = ""
      products             = []
      read_timeout         = ""
      request_fields       = []
      respect_strong_etags = ""

      response {
        content      = ""
        content_type = ""
        status_code  = ""
      }

      response_fields = []
      rocket_loader   = ""
      rules = {}
      ruleset         = ""
      security_level  = ""

      serve_stale {
        disable_stale_while_updating = ""
      }

      server_side_excludes = ""

      sni {
        value = ""
      }

      ssl         = ""
      status_code = ""
      sxg         = ""

      uri {
        origin = ""

        path {
          expression = ""
          value      = ""
        }

        query {
          expression = ""
          value      = ""
        }

      }

      version = ""
    }

    description = ""
    enabled     = ""

    exposed_credential_check {
      password_expression = ""
      username_expression = ""
    }

    logging {
      enabled = ""
    }

    ratelimit {
      characteristics            = []
      counting_expression        = ""
      mitigation_timeout         = ""
      period                     = ""
      requests_per_period        = ""
      requests_to_origin         = false
      score_per_period           = ""
      score_response_header_name = ""
    }

    ref = ""
  }

  zone_id = var.zone_id
}