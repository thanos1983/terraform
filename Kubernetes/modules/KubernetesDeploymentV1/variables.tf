variable "metadata_block" {
  description = "Standard ingress's metadata."
  type = object({
    annotations = optional(map(string))
    generate_name = optional(string)
    labels = optional(map(string))
    name = optional(string)
    namespace = optional(string)
  })
}

variable "spec_block" {
  description = "Spec defines the behavior of a ingress."
  type = object({
    template_block = object({
      metadata_block = object({
        annotations = optional(map(string))
        generate_name = optional(string)
        labels = optional(map(string))
        name = optional(string)
        namespace = optional(string)
      })
      spec_block = object({
        active_deadline_seconds = optional(number)
        affinity_block = optional(object({
          node_affinity_block = optional(object({
            preferred_during_scheduling_ignored_during_execution_blocks = optional(list(object({
              preference_block = object({
                match_expressions_blocks = optional(list(object({
                  key = optional(string)
                  operator = optional(string)
                  values = optional(set(string))
                })))
                match_fields_blocks = optional(list(object({
                  key      = string
                  operator = string
                  values = optional(set(string))
                })))
              })
              weight = number
            })))
            required_during_scheduling_ignored_during_execution_block = optional(object({
              node_selector_term_blocks = optional(list(object({
                match_expressions_blocks = optional(list(object({
                  key = optional(string)
                  operator = optional(string)
                  values = optional(set(string))
                })))
                match_fields_blocks = optional(list(object({
                  key      = string
                  operator = string
                  values = optional(set(string))
                })))
              })))
            }))
          }))
          pod_affinity_block = optional(object({
            preferred_during_scheduling_ignored_during_execution_blocks = optional(list(object({
              pod_affinity_term = object({
                topology_key = string
                label_selector_blocks = optional(list(object({
                  match_expressions_blocks = optional(list(object({
                    key = optional(string)
                    operator = optional(string)
                    values = optional(set(string))
                  })))
                  match_labels = optional(map(string))
                })))
                namespaces = optional(set(string))
              })
              weight = number
            })))
            required_during_scheduling_ignored_during_execution_block = optional(object({
              topology_key = string
              label_selector_blocks = optional(list(object({
                match_expressions_blocks = optional(list(object({
                  key = optional(string)
                  operator = optional(string)
                  values = optional(set(string))
                })))
                match_labels = optional(map(string))
              })))
              namespaces = optional(set(string))
            }))
          }))
          pod_anti_affinity = optional(object({
            preferred_during_scheduling_ignored_during_execution_blocks = optional(list(object({
              pod_affinity_term = object({
                topology_key = string
                label_selector_blocks = optional(list(object({
                  match_expressions_blocks = optional(list(object({
                    key = optional(string)
                    operator = optional(string)
                    values = optional(set(string))
                  })))
                  match_labels = optional(map(string))
                })))
                namespaces = optional(set(string))
              })
              weight = number
            })))
            required_during_scheduling_ignored_during_execution_block = optional(object({
              topology_key = string
              label_selector_blocks = optional(list(object({
                match_expressions_blocks = optional(list(object({
                  key = optional(string)
                  operator = optional(string)
                  values = optional(set(string))
                })))
                match_labels = optional(map(string))
              })))
              namespaces = optional(set(string))
            }))
          }))
        }))
        automount_service_account_token = optional(bool)
        container_block = optional(object({
          name = string
          args = optional(list(string))
          command = optional(list(string))
          env_blocks = optional(list(object({
            name = string
            value = optional(string)
            value_from_block = optional(object({
              config_map_key_ref_block = optional(object({
                key = optional(string)
                name = optional(string)
                optional = optional(bool)
              }))
              field_ref_block = optional(object({
                api_version = optional(string)
                field_path = optional(string)
              }))
              resource_field_ref_block = optional(object({
                resource = string
                container_name = optional(string)
                divisor = optional(string)
              }))
              secret_key_ref_block = optional(object({
                key = optional(string)
                name = optional(string)
                optional = optional(bool)
              }))
            }))
          })))
          env_from_blocks = optional(list(object({
            config_map_ref_block = optional(object({
              name = string
              optional = optional(bool)
            }))
            prefix = optional(string)
            secret_ref_block = optional(object({
              name = string
              optional = optional(bool)
            }))
          })))
          image = optional(string)
          image_pull_policy = optional(string)
          lifecycle_block = optional(object({

          }))
          liveness_probe_blocks = optional(list(object({})))
          port_blocks = optional(list(object({})))
          readiness_probe_block = optional(object({}))
          resources_block = optional(object({}))
          security_context_block = optional(object({}))
          startup_probe_block = optional(object({}))
          stdin = optional(bool)
          stdin_once = optional(bool)
          termination_message_path = optional(string)
          termination_message_policy = optional(string)
          tty = optional(bool)
          volume_mount_blocks = optional(list(object({})))
          working_dir = optional(string)
        }))
        dns_config_blocks = optional(list(object({})))
        dns_policy = optional(string)
        enable_service_links = optional(bool)
        host_aliases_blocks = optional(list(object({})))
        host_ipc = optional(bool)
        host_network = optional(bool)
        host_pid = optional(bool)
        hostname = optional(string)
        image_pull_secrets_blocks = optional(list(object({})))
        init_container_blocks = optional(list(object({})))
        node_name = optional(string)
        node_selector = optional(map(string))
        os_block = optional(object({}))
        priority_class_name = optional(string)
        readiness_gate_blocks = optional(list(object({})))
        restart_policy = optional(string)
        runtime_class_name = optional(string)
        scheduler_name = optional(string)
        security_context_block = optional(list(object({})))
        service_account_name = optional(string)
        share_process_namespace = optional(bool)
        subdomain = optional(string)
        termination_grace_period_seconds = optional(number)
        toleration_blocks = optional(list(object({})))
        topology_spread_constraint_blocks = optional(list(object({})))
        volume_blocks = optional(list(object({})))
      })
    })
    min_ready_seconds = optional(number)
    paused = optional(bool)
    progress_deadline_seconds = optional(number)
    replicas = optional(string)
    revision_history_limit = optional(number)
    selector_block = optional(object({}))
    strategy_block = optional(object({}))
  })
}

variable "wait_for_load_balancer" {
  description = "Terraform will wait for the load balancer to have at least 1 endpoint before considering the resource created."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.wait_for_load_balancer)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}