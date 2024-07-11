variable "metadata_block" {
  description = "Data that helps uniquely identify this object."
  type = object({
    name = string
    namespace = optional(string, "default")
    annotations = optional(map(string))
    labels = optional(map(string))
  })
}

variable "spec_block" {
  description = "Spec defines the desired state of KnativeEventing."
  type = object({
    additional_manifests_blocks = optional(list(object({
      url = optional(string)
    })))
    config = optional(map(string))
    default_broker_class = optional(string)
    deployments_blocks = optional(list(object({
      affinity_blocks = optional(object({
        node_affinity_block = optional(object({
          preferred_during_scheduling_ignored_during_execution_blocks = optional(list(object({
            preference_block = object({
              match_expressions_blocks = optional(list(object({
                key      = string
                operator = string
                values = optional(list(string))
              })))
              match_fields_blocks = optional(list(object({
                key      = string
                operator = string
                values = optional(list(string))
              })))
            })
            weight = number
          })))
          required_during_scheduling_ignored_during_execution_block = optional(object({
            node_selector_terms_blocks = list(object({
              match_expressions_blocks = optional(list(object({
                key      = string
                operator = string
                values = optional(list(string))
              })))
              match_fields_blocks = optional(list(object({
                key      = string
                operator = string
                values = optional(list(string))
              })))
            }))
          }))
        }))
        pod_affinity_block = optional(object({
          preferred_during_scheduling_ignored_during_execution_blocks = optional(list(object({
            pod_affinity_term_block = object({
              topology_key = string
              label_selector_block = optional(object({
                match_expressions_blocks = optional(list(object({
                  key      = string
                  operator = string
                  values = optional(list(string))
                })))
                match_labels = optional(map(string))
              }))
              namespaces = optional(list(string))
            })
            weight = number
          })))
          required_during_scheduling_ignored_during_execution_block = optional(object({
            topology_key = string
            label_selector_block = optional(object({
              match_expressions_block = optional(list(object({
                key      = string
                operator = string
                values = optional(list(string))
              })))
              match_labels = optional(map(string))
            }))
            namespaces = optional(list(string))
          }))
        }))
        pod_anti_affinity_block = optional(object({
          preferred_during_scheduling_ignored_during_execution_blocks = optional(list(object({
            pod_affinity_term_block = object({
              topology_key = string
              label_selector_block = optional(object({
                match_expressions_blocks = optional(list(object({
                  key      = string
                  operator = string
                  values = optional(list(string))
                })))
                match_labels = optional(map(string))
              }))
              namespaces = optional(list(string))
            })
            weight = number
          })))
          required_during_scheduling_ignored_during_execution_block = optional(object({
            topology_key = string
            label_selector_block = optional(object({
              match_expressions_block = optional(list(object({
                key      = string
                operator = string
                values = optional(list(string))
              })))
              match_labels = optional(map(string))
            }))
            namespaces = optional(list(string))
          }))
        }))
      }))
      annotations = optional(map(string))
      env_block = optional(object({
        container = string
        env_vars_block = optional(object({
          name = string
          value = optional(string)
          value_from_block = optional(object({
            config_map_key_ref_block = optional(object({
              key = string
              name = optional(string)
              optional = optional(bool)
            }))
            field_ref_block = optional(object({
              field_path = string
              api_version = optional(string, "v1")
            }))
            resource_field_ref_block = optional(object({
              resource = string
              container_name = optional(string)
              divisor = optional(string, "1")
            }))
            secret_key_ref_block = optional(object({
              key = string
              name = optional(string)
              optional = optional(bool)
            }))
          }))
        }))
      }))
      host_network = optional(bool)
      labels = optional(map(string))
      liveness_probes_blocks = optional(list(object({
        container = string
        failure_threshold = optional(number)
        initial_delay_seconds = optional(number)
        period_seconds = optional(number)
        success_threshold = optional(number)
        termination_grace_period_seconds = optional(number)
        timeout_seconds = optional(number)
      })))
      name = optional(string)
      node_selector = optional(map(string))
      readiness_probes_blocks = optional(list(object({
        container = string
        failure_threshold = optional(number)
        initial_delay_seconds = optional(number)
        period_seconds = optional(number)
        success_threshold = optional(number)
        termination_grace_period_seconds = optional(number)
        timeout_seconds = optional(number)
      })))
      replicas = optional(number)
      resources_blocks = optional(list(object({
        container = optional(string)
        limits_block = optional(object({
          cpu = optional(string)
          memory = optional(string)
        }))
        requests_block = optional(object({
          cpu = optional(string)
          memory = optional(string)
        }))
      })))
      tolerations_blocks = optional(list(object({
        effect = optional(string)
        key = optional(string)
        operator = optional(string)
        toleration_seconds = optional(number)
        value = optional(string)
      })))
      topology_spread_constraints_blocks = optional(list(object({
        max_skew           = number
        topology_key       = string
        when_unsatisfiable = string
        label_selector_block = optional(object({
          match_expressions_blocks = optional(list(object({
            key      = string
            operator = string
            values = optional(list(string))
          })))
          match_labels = optional(map(string))
        }))
      })))
    })))
    high_availability_block = optional(object({
      replicas = optional(number)
    }))
    manifests_blocks = optional(list(object({
      url = optional(string)
    })))
    pod_disruption_budgets_blocks = optional(list(object({
      max_unavailable = optional(string)
      min_available = optional(string)
      name = optional(string)
    })))
    registry_block = optional(object({
      default = optional(string)
      image_pull_secrets_blocks = optional(list(object({
        name = optional(string)
      })))
      override = optional(map(string))
    }))
    services_blocks = optional(list(object({
      annotations = optional(map(string))
      labels = optional(map(string))
      name = optional(string)
      selector = optional(map(string))
    })))
    sink_binding_selection_mode = optional(string)
    source_block = optional(object({
      ceph_block = optional(object({
        enabled = optional(bool)
      }))
      github_block = optional(object({
        enabled = optional(bool)
      }))
      gitlab_block = optional(object({
        enabled = optional(bool)
      }))
      kafka_block = optional(object({
        enabled = optional(bool)
      }))
      rabbitmq_block = optional(object({
        enabled = optional(bool)
      }))
      redis_block = optional(object({
        enabled = optional(bool)
      }))
    }))
    version = optional(string)
    workloads_blocks = optional(list(object({
      affinity_block = optional(object({
        node_affinity_block = optional(object({
          preferred_during_scheduling_ignored_during_execution_blocks = optional(list(object({
            preference_block = object({
              match_expressions_blocks = optional(list(object({
                key      = string
                operator = string
                values = optional(list(string))
              })))
              match_fields_blocks = optional(list(object({
                key      = string
                operator = string
                values = optional(list(string))
              })))
            })
            weight = number
          })))
          required_during_scheduling_ignored_during_execution_block = optional(object({
            node_selector_terms_blocks = list(object({
              match_expressions_blocks = optional(list(object({
                key      = string
                operator = string
                values = optional(list(string))
              })))
              match_fields_blocks = optional(list(object({
                key      = string
                operator = string
                values = optional(list(string))
              })))
            }))
          }))
        }))
        pod_affinity_block = optional(object({
          preferred_during_scheduling_ignored_during_execution_blocks = optional(list(object({
            pod_affinity_term_block = object({
              topology_key = string
              label_selector_block = optional(object({
                match_expressions_blocks = optional(list(object({
                  key      = string
                  operator = string
                  values = optional(list(string))
                })))
                match_labels = optional(map(string))
              }))
              namespaces = optional(list(string))
            })
            weight = number
          })))
          required_during_scheduling_ignored_during_execution_block = optional(object({
            topology_key = string
            label_selector_block = optional(object({
              match_expressions_block = optional(list(object({
                key      = string
                operator = string
                values = optional(list(string))
              })))
              match_labels = optional(map(string))
            }))
            namespaces = optional(list(string))
          }))
        }))
        pod_anti_affinity_block = optional(object({
          preferred_during_scheduling_ignored_during_execution_blocks = optional(list(object({
            pod_affinity_term_block = object({
              topology_key = string
              label_selector_block = optional(object({
                match_expressions_blocks = optional(list(object({
                  key      = string
                  operator = string
                  values = optional(list(string))
                })))
                match_labels = optional(map(string))
              }))
              namespaces = optional(list(string))
            })
            weight = number
          })))
          required_during_scheduling_ignored_during_execution_block = optional(object({
            topology_key = string
            label_selector_block = optional(object({
              match_expressions_block = optional(list(object({
                key      = string
                operator = string
                values = optional(list(string))
              })))
              match_labels = optional(map(string))
            }))
            namespaces = optional(list(string))
          }))
        }))
      }))
      annotations = optional(map(string))
      env_blocks = optional(list(object({
        container = string
        env_vars_block = optional(object({
          name = string
          value = optional(string)
          value_from_block = optional(object({
            config_map_key_ref_block = optional(object({
              key = string
              name = optional(string)
              optional = optional(bool)
            }))
            field_ref_block = optional(object({
              field_path = string
              api_version = optional(string, "v1")
            }))
            resource_field_ref_block = optional(object({
              resource = string
              container_name = optional(string)
              divisor = optional(string, "1")
            }))
            secret_key_ref_block = optional(object({
              key = string
              name = optional(string)
              optional = optional(bool)
            }))
          }))
        }))
      })))
      host_network = optional(bool)
      labels = optional(map(string))
      liveness_probes_blocks = optional(list(object({
        container = string
        failure_threshold = optional(number)
        initial_delay_seconds = optional(number)
        period_seconds = optional(number)
        success_threshold = optional(number)
        termination_grace_period_seconds = optional(number)
        timeout_seconds = optional(number)
      })))
      name = optional(string)
      node_selector = optional(map(string))
      readiness_probes_blocks = optional(list(object({
        container = string
        failure_threshold = optional(number)
        initial_delay_seconds = optional(number)
        period_seconds = optional(number)
        success_threshold = optional(number)
        termination_grace_period_seconds = optional(number)
        timeout_seconds = optional(number)
      })))
      replicas = optional(number)
      resources_blocks = optional(list(object({
        container = optional(string)
        limits_block = optional(object({
          cpu = optional(string)
          memory = optional(string)
        }))
        requests_block = optional(object({
          cpu = optional(string)
          memory = optional(string)
        }))
      })))
      tolerations_blocks = optional(list(object({
        effect = optional(string)
        key = optional(string)
        operator = optional(string)
        toleration_seconds = optional(number)
        value = optional(string)
      })))
      topology_spread_constraints_blocks = optional(list(object({
        max_skew           = number
        topology_key       = string
        when_unsatisfiable = string
        label_selector_block = optional(object({
          match_expressions_blocks = optional(list(object({
            key      = string
            operator = string
            values = optional(list(string))
          })))
          match_labels = optional(map(string))
        }))
      })))
      version = optional(string)
      volume_mounts_blocks = optional(list(object({
        mount_path = string
        name       = string
        mount_propagation = optional(string)
        read_only = optional(bool)
        sub_path = optional(string)
        sub_path_expr = optional(string)
      })))
    })))
  })
}