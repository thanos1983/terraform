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
    init_container = optional(object({
      args    = optional(list(string))
      command = optional(list(string))
      cpu     = optional(string)
      env     = optional(list(object({
        name        = string
        secret_name = optional(string)
        value       = optional(string)
      })), [])
      ephemeral_storage = optional(number)
      image             = string
      memory            = string
      name              = string
      volume_mounts     = optional(object({
        name = string
        path = string
      }), null)
    }), null)
    container = list(object({
      args    = optional(list(string))
      command = optional(list(string))
      cpu     = optional(string)
      env     = optional(list(object({
        name        = string
        secret_name = optional(string)
        value       = optional(string)
      })), [])
      ephemeral_storage = optional(number)
      image             = string
      liveness_probe    = optional(object({
        failure_count_threshold = optional(number, 3)
        header                  = optional(object({
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
      memory          = string
      name            = string
      readiness_probe = optional(object({
        failure_count_threshold = optional(number, 3)
        header                  = optional(object({
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
      startup_probe = optional(object({
        failure_count_threshold = optional(number, 3)
        header                  = optional(object({
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
      volume_mounts = optional(object({
        name = string
        path = string
      }), null)
    }))
    max_replicas           = optional(number)
    min_replicas           = optional(number)
    azure_queue_scale_rule = optional(list(object({
      name           = string
      queue_name     = string
      queue_length   = string
      authentication = list(object({
        secret_name       = string
        trigger_parameter = string
      }))
    })))
    custom_scale_rule = optional(list(object({
      name             = string
      custom_rule_type = string
      metadata         = map(any)
      authentication   = optional(list(object({
        secret_name       = string
        trigger_parameter = string
      })), [])
    })))
    http_scale_rule = optional(list(object({
      name                = string
      concurrent_requests = number
      authentication      = optional(list(object({
        secret_name       = string
        trigger_parameter = string
      })), [])
    })))
    tcp_scale_rule = optional(list(object({
      name                = string
      concurrent_requests = number
      authentication      = optional(list(object({
        secret_name       = string
        trigger_parameter = string
      })), [])
    })))
    revision_suffix = optional(string)
    volume          = optional(list(object({
      name         = string
      storage_name = optional(string)
      storage_type = optional(string)
    })), [])
  })
  default = null
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