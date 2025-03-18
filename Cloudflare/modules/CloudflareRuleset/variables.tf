variable "kind" {
  description = "The name of the record."
  type        = string
}

variable "name" {
  description = "Name of the ruleset."
  type        = string
}

variable "phase" {
  description = "Point in the request/response lifecycle where the ruleset will be created."
  type        = string
}

variable "account_id" {
  description = "The account identifier to target for the resource."
  type        = string
  default     = null
}

variable "description" {
  description = "Brief summary of the ruleset and its intended use."
  type        = bool
  default     = null
}

variable "rules_block" {
  description = "Comments or notes about the DNS record."
  type        = object({
    expression = string
    action     = optional(string)

    action_parameters_block = optional(object({
      additional_cacheable_ports = optional(list(number))
      algorithms_blocks          = optional(list(object({
        name = string
      })), null)
      automatic_https_rewrites = optional(bool)

      autominify_block = optional(object({
        css  = optional(string)
        html = optional(string)
        js   = optional(string)
      }), null)

      bic = optional(string)

      browser_ttl_block = optional(list(object({
        mode    = string
        default = optional(number)
      })), null)

      cache = optional(bool)

      cache_key_block = optional(list(object({
        cache_by_device_type  = optional(bool)
        cache_deception_armor = optional(bool)

        custom_key_block = optional(object({
          cookie_block = optional(object({
            check_presence = optional(set(string))
            include        = optional(set(string))
          }), null)

          header_block = optional(object({
            check_presence = optional(set(string))
            exclude_origin = optional(bool)
            include        = optional(set(string))
          }), null)

          host_block = optional(object({
            resolved = optional(bool)
          }), null)

          query_string_block = optional(object({
            exclude = optional(set(string))
            include = optional(set(string))
          }), null)

          user_block = optional(object({
            device_type = optional(bool)
            geo         = optional(bool)
            lang        = optional(bool)
          }), null)
        }), null)

        ignore_query_strings_order = optional(bool)
      })), null)
    }))

    content         = optional(string)
    content_type    = optional(string)
    cookie_fields   = optional(set(string))
    disable_apps    = optional(bool)
    disable_railgun = optional(bool)
    disable_rum     = optional(bool)

    edge_ttl_blocks = optional(list(object({
      mode    = string
      default = optional(number)

      status_code_ttl_block = optional(object({
        status_code = optional(number)

        status_code_range_block = optional(object({
          from = optional(number)
          to   = optional(number)
        }), null)

        value = optional(number)
      }), null)
    })), [])

    email_obfuscation = optional(bool)
    fonts             = optional(bool)

    from_list_block = optional(object({
      key  = optional(string)
      name = optional(string)
    }), null)

    from_value_block = optional(object({
      preserve_query_string = optional(bool)
      status_code           = optional(number)

      target_url_block = optional(object({
        expression = optional(string)
        value      = optional(string)
      }), null)
    }), null)

    headers_block = optional(object({
      operation  = string
      expression = optional(string)
      value      = optional(string)
    }), null)

    host_header        = optional(string)
    hotlink_protection = optional(bool)
    id                 = optional(string)
    increment          = optional(number)

    matched_data_block = optional(object({
      public_key = optional(string)
    }), null)

    mirage                   = optional(bool)
    opportunistic_encryption = optional(bool)

    origin_block = optional(object({
      host = optional(string)
      port = optional(string)
    }), null)

    origin_cache_control       = optional(bool)
    origin_error_page_passthru = optional(bool)

    overrides_block = optional(object({
      action = optional(string)

      categories_block = optional(object({
        action   = optional(string)
        category = optional(string)
        enabled  = optional(bool)
      }), null)

      enabled = optional(bool)

      rules_block = optional(object({
        action            = optional(string)
        enabled           = optional(bool)
        id                = optional(string)
        score_threshold   = optional(number)
        sensitivity_level = optional(string)
      }), null)

      sensitivity_level = optional(string)
    }), null)

    phases               = optional(set(string))
    polish               = optional(string)
    products             = optional(set(string))
    read_timeout         = optional(number)
    request_fields       = optional(set(string))
    respect_strong_etags = optional(bool)

    response_block = optional(object({
      content      = optional(string)
      content_type = optional(string)
      status_code  = optional(number)
    }), null)

    response_fields = optional(set(string))
    rocket_loader   = optional(bool)
    rules           = optional(map(string))
    ruleset         = optional(string)
    security_level  = optional(string)

    serve_stale_block = optional(object({
      disable_stale_while_updating = optional(bool)
    }), null)

    server_side_excludes = optional(bool)

    sni_block = optional(object({
      value = optional(string)
    }), null)

    ssl         = optional(string)
    status_code = optional(number)
    sxg         = optional(bool)

    uri_block = optional(object({
      origin = optional(bool)

      path_block = optional(object({
        expression = optional(string)
        value      = optional(string)
      }), null)

      query_block = optional(object({
        expression = optional(string)
        value      = optional(string)
      }), null)
    }), null)

    version = optional(string)

    description = optional(string)
    enabled     = optional(bool)

    exposed_credential_check_block = optional(object({
      password_expression = optional(string)
      username_expression = optional(string)
    }), null)

    logging_block = optional(object({
      enabled = optional(bool)
    }), null)

    ratelimit_block = optional(object({
      characteristics            = optional(set(string))
      counting_expression        = optional(string)
      mitigation_timeout         = optional(number)
      period                     = optional(number)
      score_per_period           = optional(number)
      requests_to_origin         = optional(bool)
      requests_per_period        = optional(number)
      score_response_header_name = optional(string)
    }), null)

    ref = optional(string)
  })
  default = null
}

variable "zone_id" {
  description = "Map of attributes that constitute the record value."
  type        = string
  default     = null
}