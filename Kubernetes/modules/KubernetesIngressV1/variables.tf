variable "metadata_block" {
  description = "Standard ingress's metadata."
  type        = object({
    annotations   = optional(any)
    generate_name = optional(string)
    labels        = optional(any)
    name          = optional(string)
    namespace     = optional(string)
  })
}

variable "spec_block" {
  description = "Spec defines the behavior of a ingress."
  type        = object({
    default_backend_block = optional(object({
      resource_block = optional(object({
        kind      = string
        name      = string
        api_group = string
      }), null)
      service_block = optional(object({
        name       = string
        port_block = optional(object({
          name   = optional(string)
          number = optional(number)
        }), null)
      }), null)
    }), null)
    rule_blocks = optional(list(object({
      host        = optional(string)
      http_blocks = optional(list(object({
        path_blocks = list(object({
          path          = string
          path_type     = optional(string)
          backend_block = object({
            resource_block = optional(object({
              kind      = string
              name      = string
              api_group = string
            }), null)
            service_block = optional(object({
              name       = string
              port_block = optional(object({
                name   = optional(string)
                number = optional(number)
              }), null)
            }), null)
          })
        }))
      })), [])
    })), [])
    tls_blocks = optional(list(object({
      hosts       = optional(list(string))
      secret_name = optional(string)
    })), [])
    ingress_class_name = optional(string)
  })
}

variable "wait_for_load_balancer" {
  description = "Terraform will wait for the load balancer to have at least 1 endpoint before considering the resource created."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.wait_for_load_balancer)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}