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

variable "rules" {
  description = "The list of rules in the ruleset."
  type = list(object({
    action = optional(string)
    action_parameters = optional(object({
      additional_cacheable_ports = optional(list(number))

      algorithms = optional(list(object({
        name = string
      })), null)

      autominify = optional(object({
        css = optional(bool)
        html = optional(bool)
        js = optional(bool)
      }), null)

      bic = optional(bool)

      browser_ttl = optional(object({
        mode = string
        default = optional(number)
      }), null)

      cache = optional(bool)

      cache_key = optional(object({
        cache_by_device_type = optional(bool)
        cache_deception_armor = optional(bool)

        custom_key = optional(object({
          cookie = optional(object({
            check_presence = optional(list(string))
            include = optional(list(string))
          }), null)

          header = optional(object({
            check_presence = optional(list(string))
            contains = optional(map(list(string)))
            exclude_origin = optional(bool)
            include = optional(list(string))
          }), null)

          host = optional(object({
            resolved = optional(bool)
          }), null)

          query_string = optional(object({
            exclude = optional(object({
              all = optional(bool)
              list = optional(list(string))
            }), null)

            include = optional(object({
              all = optional(bool)
              list = optional(list(string))
            }), null)
          }), null)

          user = optional(object({
            device_type = optional(bool)
            geo = optional(bool)
            lang = optional(bool)
          }), null)
        }), null)

        ignore_query_strings_order = optional(bool)
      }), null)

      cache_reserve = optional(object({
        eligible          = bool
        minimum_file_size = number
      }), null)

      content = optional(string)
      content_type = optional(string)

      cookie_fields = optional(list(object({
        name = string
      })), null)

      disabled_apps = optional(bool)
      disable_rum = optional(bool)
      disable_zaraz = optional(bool)

      edge_ttl = optional(object({
        mode = string
        default = optional(number)
        status_code_ttl = optional(list(object({
          value = number
          status_code = optional(number)

          status_code_range = optional(object({
            from = optional(number)
            to = optional(number)
          }), null)
        })), null)
      }), null)

      email_obfuscation = optional(bool)
      fonts = optional(bool)

      from_list = optional(object({
        key = optional(string)
        name = optional(string)
      }), null)

      from_value = optional(object({
        preserve_query_string = optional(bool)
        status_code = optional(number)

        target_url = optional(object({
          expression = optional(string)
          value = optional(string)
        }), null)
      }), null)

      headers = optional(map(object({
        operation = string
        expression = optional(string)
        value = optional(string)
      })))

      host_header = optional(string)
      hotlink_protection = optional(bool)
      id = optional(string)
      increment = optional(number)

      matched_data = optional(object({
        public_key = string
      }), null)

      mirage = optional(bool)
      opportunistic_encryption = optional(bool)

      origin = optional(object({
        host = optional(string)
        port = optional(number)
      }), null)

      origin_cache_control = optional(bool)
      origin_error_page_passthru = optional(bool)

      overrides = optional(object({
        action = optional(string)

        categories = optional(list(object({
          category = string
          action = optional(string)
          enabled = optional(bool)
          sensitivity_level = optional(string)
        })), null)

        enabled = optional(bool)

        rules = optional(list(object({
          id = string
          action = optional(string)
          enabled = optional(bool)
          score_threshold = optional(number)
          sensitivity_level = optional(string)
        })), null)

        sensitivity_level = optional(string)
      }), null)

      phases = optional(list(string))
      polish = optional(string)
      products = optional(list(string))
      read_timeout = optional(number)

      request_fields = optional(list(object({
        name = string
      })), null)

      respect_strong_etags = optional(bool)

      response = optional(object({
        content      = string
        content_type = string
        status_code  = number
      }), null)

      response_fields = optional(list(object({
        name = string
      })), null)

      rocket_loader = optional(bool)
      rules = optional(map(list(string)))
      ruleset = optional(string)
      rulesets = optional(list(string))
      security_level = optional(string)

      serve_stale = optional(object({
        disable_stale_while_updating = bool
      }), null)

      server_side_excludes = optional(bool)

      sni = optional(object({
        value = string
      }), null)

      ssl = optional(string)
      status_code = optional(number)
      sxg = optional(bool)

      uri = optional(object({
        path = optional(object({
          expression = optional(string)
          value = optional(string)
        }), null)

        query = optional(object({
          expression = optional(string)
          value = optional(string)
        }), null)
      }), null)
    }), null)

    description = optional(string)
    enabled = optional(bool)

    exposed_credential_check = optional(object({
      password_expression = string
      username_expression = string
    }), null)

    expression = optional(string)

    logging = optional(object({
      enabled = bool
    }), null)

    ratelimit = optional(object({
      characteristics = list(string)
      period = number
      counting_expression = optional(string)
      mitigation_timeout = optional(number)
      requests_per_period = optional(number)
      requests_to_origin = optional(bool)
      score_per_period = optional(number)
      score_response_header_name = optional(string)
    }), null)

    ref = optional(string)
  }))
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

variable "zone_id" {
  description = "Map of attributes that constitute the record value."
  type        = string
  default     = null
}