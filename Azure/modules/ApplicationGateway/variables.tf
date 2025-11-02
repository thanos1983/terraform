variable "name" {
  description = "The name of the Application Gateway."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to the Application Gateway should exist."
  type        = string
}

variable "location" {
  description = "The Azure region where the Application Gateway should exist."
  type        = string
}

variable "backend_address_pool_blocks" {
  description = "One or more backend_address_pool blocks as defined below."
  type = list(object({
    name         = string
    fqdns        = optional(list(string))
    ip_addresses = optional(list(string))
  }))
}

variable "backend_http_settings_blocks" {
  description = "One or more backend_http_settings blocks as defined below."
  type = list(object({
    cookie_based_affinity               = string
    affinity_cookie_name                = optional(string)
    name                                = string
    path                                = optional(string)
    port                                = number
    probe_name                          = optional(string)
    protocol                            = string
    request_timeout                     = optional(number, 30)
    host_name                           = optional(bool, true)
    pick_host_name_from_backend_address = optional(bool, false)
    authentication_certificate_blocks = optional(list(object({
      name = string
    })), [])
    trusted_root_certificate_names = optional(list(string))
    connection_draining_block = optional(object({
      enabled           = bool
      drain_timeout_sec = number
    }), null)
  }))
}

variable "frontend_ip_configuration_blocks" {
  description = "One or more frontend_ip_configuration blocks as defined below."
  type = list(object({
    name                            = string
    subnet_id                       = optional(string)
    private_ip_address              = optional(string)
    public_ip_address_id            = optional(string)
    private_ip_address_allocation   = optional(string)
    private_link_configuration_name = optional(string)
  }))
}

variable "frontend_port_blocks" {
  description = "One or more frontend_port blocks as defined below."
  type = list(object({
    name = string
    port = number
  }))
}

variable "gateway_ip_configuration_blocks" {
  description = "One or more gateway_ip_configuration blocks as defined below."
  type = list(object({
    name      = string
    subnet_id = string
  }))
}

variable "http_listener_blocks" {
  description = "One or more http_listener blocks as defined below."
  type = list(object({
    name                           = string
    frontend_ip_configuration_name = string
    frontend_port_name             = string
    host_name                      = optional(string)
    host_names                     = optional(list(string))
    protocol                       = string
    require_sni                    = optional(bool, false)
    ssl_certificate_name           = optional(string)
    custom_error_configuration_blocks = optional(list(object({
      status_code           = string
      custom_error_page_url = string
    })), [])
    firewall_policy_id = optional(string)
    ssl_profile_name   = optional(string)
  }))
}

variable "request_routing_rule_blocks" {
  description = "One or more request_routing_rule blocks as defined below."
  type = list(object({
    name                        = string
    rule_type                   = string
    http_listener_name          = string
    backend_address_pool_name   = optional(string)
    backend_http_settings_name  = optional(string)
    redirect_configuration_name = optional(string)
    rewrite_rule_set_name       = optional(string)
    url_path_map_name           = optional(string)
    priority                    = optional(number)
  }))
}

variable "sku_block" {
  description = "A sku block as defined below."
  type = object({
    name     = string
    tier     = string
    capacity = optional(number)
  })
}

variable "fips_enabled" {
  description = "Is FIPS enabled on the Application Gateway?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.fips_enabled)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "global_block" {
  description = "A global block as defined below."
  type = object({
    request_buffering_enabled  = bool
    response_buffering_enabled = bool
  })
  default = null
}

variable "identity_block" {
  description = "An identity block as defined below."
  type = object({
    type         = string
    identity_ids = list(string)
  })
  default = null
}

variable "private_link_configuration_blocks" {
  description = "One or more private_link_configuration blocks as defined below."
  type = list(object({
    name = string
    ip_configuration_blocks = list(object({
      name                          = string
      subnet_id                     = string
      private_ip_address_allocation = string
      primary                       = bool
      private_ip_address            = optional(string)
    }))
  }))
  default = []
}

variable "zones" {
  description = "Specifies a list of Availability Zones in which this Application Gateway should be located."
  type        = list(string)
  default     = null
}

variable "trusted_client_certificate_blocks" {
  description = "One or more trusted_client_certificate blocks as defined below."
  type = list(object({
    name = string
    data = string
  }))
  default = []
}

variable "ssl_profile_blocks" {
  description = "One or more ssl_profile blocks as defined below."
  type = list(object({
    name                                 = string
    trusted_client_certificate_names     = optional(list(string))
    verify_client_cert_issuer_dn         = optional(bool, false)
    verify_client_certificate_revocation = optional(string)
    ssl_policy_block = optional(object({
      disabled_protocols   = list(string)
      policy_type          = optional(string)
      policy_name          = optional(string)
      cipher_suites        = optional(list(string))
      min_protocol_version = optional(string)
    }), null)
  }))
  default = []
}

variable "authentication_certificate_blocks" {
  description = "One or more authentication_certificate blocks as defined below."
  type = list(object({
    name = string
    data = string
  }))
  default = []
}

variable "trusted_root_certificate_blocks" {
  description = "One or more trusted_root_certificate blocks as defined below."
  type = list(object({
    name                = string
    data                = optional(string)
    key_vault_secret_id = optional(string)
  }))
  default = []
}

variable "ssl_policy_blocks" {
  description = "An ssl_policy block as defined below."
  type = list(object({
    disabled_protocols   = optional(list(string))
    policy_type          = optional(string)
    policy_name          = optional(string)
    cipher_suites        = optional(list(string))
    min_protocol_version = optional(string)
  }))
  default = []
}

variable "enable_http2" {
  description = "Is HTTP2 enabled on the application gateway resource?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.enable_http2)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "force_firewall_policy_association" {
  description = "Is the Firewall Policy associated with the Application Gateway?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.force_firewall_policy_association)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "probe_blocks" {
  description = "One or more probe blocks as defined below."
  type = list(object({
    host                                      = optional(string)
    interval                                  = number
    name                                      = string
    protocol                                  = string
    path                                      = string
    timeout                                   = number
    unhealthy_threshold                       = number
    port                                      = optional(number)
    pick_host_name_from_backend_http_settings = optional(bool, false)
    match_block = optional(object({
      body        = optional(string)
      status_code = list(string)
    }), null)
    minimum_servers = optional(number, 0)
  }))
  default = []
}

variable "ssl_certificate_blocks" {
  description = "One or more ssl_certificate blocks as defined below."
  type = list(object({
    name                = string
    data                = optional(string)
    password            = optional(string)
    key_vault_secret_id = optional(string)
  }))
  default = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}

variable "url_path_map_blocks" {
  description = "One or more url_path_map blocks as defined below."
  type = list(object({
    name                                = string
    default_backend_address_pool_name   = optional(string)
    default_backend_http_settings_name  = optional(string)
    default_redirect_configuration_name = optional(string)
    default_rewrite_rule_set_name       = optional(string)
    path_rule_blocks = list(object({
      name                        = string
      paths                       = list(string)
      backend_address_pool_name   = optional(string)
      backend_http_settings_name  = optional(string)
      redirect_configuration_name = optional(string)
      rewrite_rule_set_name       = optional(string)
      firewall_policy_id          = optional(string)
    }))
  }))
  default = []
}

variable "waf_configuration_block" {
  description = "A waf_configuration block as defined below."
  type = object({
    enabled          = bool
    firewall_mode    = string
    rule_set_type    = optional(string)
    rule_set_version = string
    disabled_rule_group_blocks = optional(list(object({
      rule_group_name = string
      rule            = optional(list(string))
    })), [])
    file_upload_limit_mb     = optional(number)
    request_body_check       = optional(bool, true)
    max_request_body_size_kb = optional(number)
    exclusion_blocks = optional(list(object({
      match_variable          = string
      selector_match_operator = optional(string)
      selector                = optional(string)
    })), [])
  })
  default = null
}

variable "custom_error_configuration_blocks" {
  description = "One or more custom_error_configuration blocks as defined below."
  type = list(object({
    status_code           = string
    custom_error_page_url = string
  }))
  default = []
}

variable "firewall_policy_id" {
  description = "The ID of the Web Application Firewall Policy."
  type        = string
  default     = null
}

variable "redirect_configuration_blocks" {
  description = "One or more redirect_configuration blocks as defined below."
  type = list(object({
    name                 = string
    redirect_type        = string
    target_listener_name = optional(string)
    target_url           = optional(string)
    include_path         = optional(bool, false)
    include_query_string = optional(bool, false)
  }))
  default = []
}

variable "autoscale_configuration_block" {
  description = "An autoscale_configuration block as defined below."
  type = object({
    min_capacity = number
    max_capacity = optional(number)
  })
  default = null
}

variable "rewrite_rule_set_blocks" {
  description = "One or more rewrite_rule_set blocks as defined below."
  type = list(object({
    name = string
    rewrite_rule_blocks = optional(list(object({
      name          = string
      rule_sequence = number
      condition_blocks = optional(list(object({
        variable    = string
        pattern     = string
        ignore_case = optional(bool, false)
        negate      = optional(bool, false)
      })), [])
      request_header_configuration_blocks = optional(list(object({
        header_name  = string
        header_value = string
      })), [])
      response_header_configuration_blocks = optional(list(object({
        header_name  = string
        header_value = string
      })), [])
      url_blocks = optional(list(object({
        path         = optional(string)
        query_string = optional(string)
        components   = optional(string)
        reroute      = optional(bool)
      })), [])
    })), [])
  }))
  default = []
}
