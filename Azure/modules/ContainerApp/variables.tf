variable "container_app_environment_id" {
  description = "The ID of the Container App Environment within which this Container App should exist."
  type        = string
}

variable "name" {
  description = "Specifies the name of the Public IP."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where this Public IP should exist."
  type        = string
}

variable "revision_mode" {
  description = "The revisions operational mode for the Container App."
  type        = string
  validation {
    condition     = contains(["Single", "Multiple"], title(var.revision_mode))
    error_message = "Possible values are Single and Multiple."
  }
  default = "Single"
}

variable "template_block" {
  description = "A template block as detailed below."
  type        = object({
    init_container_block = optional(object({
      args       = optional(list(string))
      command    = optional(list(string))
      cpu        = optional(string)
      env_blocks = optional(list(object({
        name        = string
        secret_name = optional(string)
        value       = optional(string)
      })), [])
      ephemeral_storage   = optional(number)
      image               = string
      memory              = string
      name                = string
      volume_mounts_block = optional(object({
        name = string
        path = string
      }), null)
    }), null)
    container_blocks = list(object({
      args       = optional(list(string))
      command    = optional(list(string))
      cpu        = string
      env_blocks = optional(list(object({
        name        = string
        secret_name = optional(string)
        value       = optional(string)
      })), [])
      ephemeral_storage    = optional(number)
      image                = string
      liveness_probe_block = optional(object({
        failure_count_threshold = optional(number, 3)
        header_block            = optional(object({
          name  = string
          value = string
        }), null)
        host                             = optional(string)
        initial_delay                    = optional(number)
        interval_seconds                 = optional(number)
        path                             = optional(string)
        port                             = number
        termination_grace_period_seconds = optional(number)
        timeout                          = optional(number)
        transport                        = string
      }), null)
      memory                = string
      name                  = string
      readiness_probe_block = optional(object({
        failure_count_threshold = optional(number, 3)
        header_block            = optional(object({
          name  = string
          value = string
        }), null)
        host                    = optional(string)
        interval_seconds        = optional(number)
        path                    = optional(string)
        port                    = number
        success_count_threshold = optional(number)
        timeout                 = optional(number)
        transport               = string
      }), null)
      startup_probe_block = optional(object({
        failure_count_threshold = optional(number, 3)
        header_block            = optional(object({
          name  = string
          value = string
        }), null)
        host                             = optional(string)
        interval_seconds                 = optional(number)
        path                             = optional(string)
        port                             = number
        termination_grace_period_seconds = optional(number)
        timeout                          = optional(number)
        transport                        = string
      }), null)
      volume_mounts_block = optional(object({
        name = string
        path = string
      }), null)
    }))
    max_replicas                  = optional(number)
    min_replicas                  = optional(number)
    azure_queue_scale_rule_blocks = optional(list(object({
      name                  = string
      queue_name            = string
      queue_length          = string
      authentication_blocks = list(object({
        secret_name       = string
        trigger_parameter = string
      }))
    })), [])
    custom_scale_rule_blocks = optional(list(object({
      name                  = string
      custom_rule_type      = string
      metadata              = map(any)
      authentication_blocks = optional(list(object({
        secret_name       = string
        trigger_parameter = string
      })), [])
    })), [])
    http_scale_rule_blocks = optional(list(object({
      name                  = string
      concurrent_requests   = number
      authentication_blocks = optional(list(object({
        secret_name       = string
        trigger_parameter = string
      })), [])
    })), [])
    tcp_scale_rule_blocks = optional(list(object({
      name                  = string
      concurrent_requests   = number
      authentication_blocks = optional(list(object({
        secret_name       = string
        trigger_parameter = string
      })), [])
    })), [])
    revision_suffix = optional(string)
    volume_blocks   = optional(list(object({
      name         = string
      storage_name = optional(string)
      storage_type = optional(string)
    })), [])
  })
}

variable "dapr_block" {
  description = "A dapr block as detailed below."
  type        = object({
    app_id       = string
    app_port     = optional(number)
    app_protocol = optional(string)
  })
  default = null
}

variable "identity_block" {
  description = "An identity block as detailed below."
  type        = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "ingress_block" {
  description = "An ingress block as detailed below."
  type        = object({
    allow_insecure_connections = optional(bool)
    custom_domain_blocks       = list(object({
      certificate_binding_type = optional(bool)
      certificate_id           = string
      name                     = string
    }))
    fqdn                           = string
    external_enabled               = optional(bool)
    ip_security_restriction_blocks = list(object({
      action           = string
      description      = optional(string)
      ip_address_range = string
      name             = string
    }))
    target_port           = number
    exposed_port          = optional(number)
    traffic_weight_blocks = optional(list(object({
      label           = optional(string)
      latest_revision = optional(bool)
      revision_suffix = optional(string)
      percentage      = number
    })), [])
  })
  default = null
}

variable "registry_block" {
  description = "A registry block as detailed below."
  type        = object({
    server               = string
    identity             = optional(string)
    password_secret_name = optional(string)
    username             = optional(string)
  })
  default = null
}

variable "secret_blocks" {
  description = "One or more secret block as detailed below."
  type        = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "workload_profile_name" {
  description = "The name of the Workload Profile in the Container App Environment to place this Container App."
  type        = string
  default     = null
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