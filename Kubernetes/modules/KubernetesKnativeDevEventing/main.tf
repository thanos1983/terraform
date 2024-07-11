data "k8s_operator_knative_dev_knative_eventing_v1beta1_manifest" "knative_eventing" {
  dynamic "metadata" {
    for_each = var.metadata_block[*]
    content {
      name        = metadata.value.name
      namespace   = metadata.value.namespace
      annotations = metadata.value.annotations
      labels      = metadata.value.labels
    }
  }

  dynamic "spec" {
    for_each = var.spec_block[*]
    content {
      dynamic "additional_manifests" {
        for_each = spec.value.additional_manifests_blocks
        content {
          url = additional_manifests.value.url
        }
      }

      config               = spec.value.config
      default_broker_class = spec.value.default_broker_class

      dynamic "deployments" {
        for_each = spec.value.deployments_blocks
        content {
          dynamic "affinity" {
            for_each = deployments.value.affinity_blocks
            content {
              dynamic "node_affinity" {
                for_each = affinity.value.node_affinity_block[*]
                content {
                  dynamic "preferred_during_scheduling_ignored_during_execution" {
                    for_each = node_affinity.value.preferred_during_scheduling_ignored_during_execution_blocks
                    content {
                      dynamic "preference" {
                        for_each = preferred_during_scheduling_ignored_during_execution.value.preference_block[*]
                        content {
                          dynamic "match_expressions" {
                            for_each = preference.value.match_expressions_blocks
                            content {
                              key      = match_expressions.value.key
                              operator = match_expressions.value.operator
                              values   = match_expressions.value.values
                            }
                          }
                          dynamic "match_fields" {
                            for_each = preference.value.match_fields_blocks
                            content {
                              key      = match_fields.value.key
                              operator = match_fields.value.operator
                              values   = match_fields.value.values
                            }
                          }
                        }
                      }
                      weight = preferred_during_scheduling_ignored_during_execution.value.weight
                    }
                  }

                  dynamic "required_during_scheduling_ignored_during_execution" {
                    for_each = affinity.value.required_during_scheduling_ignored_during_execution_block[*]
                    content {
                      dynamic "node_selector_terms" {
                        for_each = required_during_scheduling_ignored_during_execution.value.node_selector_terms_blocks
                        content {
                          dynamic "match_expressions" {
                            for_each = node_selector_terms.value.match_expressions_blocks
                            content {
                              key      = match_expressions.value.key
                              operator = match_expressions.value.operator
                              values   = match_expressions.value.values
                            }
                          }

                          dynamic "match_fields" {
                            for_each = node_selector_terms.value.match_fields_blocks
                            content {
                              key      = match_fields.value.key
                              operator = match_fields.value.operator
                              values   = match_fields.value.values
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }

              dynamic "pod_affinity" {
                for_each = affinity.value.pod_affinity_block[*]
                content {
                  dynamic "preferred_during_scheduling_ignored_during_execution" {
                    for_each = pod_affinity.value.preferred_during_scheduling_ignored_during_execution_blocks
                    content {
                      dynamic "pod_affinity_term" {
                        for_each = preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term_block[*]
                        content {
                          topology_key = pod_affinity_term.value.topology_key
                          dynamic "label_selector" {
                            for_each = pod_affinity_term.value.label_selector_block[*]
                            content {
                              dynamic "match_expressions" {
                                for_each = label_selector.value.match_expressions_blocks
                                content {
                                  key      = match_expressions.value.key
                                  operator = match_expressions.value.operator
                                  values   = match_expressions.value.values
                                }
                              }
                              match_labels = label_selector.value.match_labels
                            }
                          }
                          namespaces = pod_affinity_term.value.namespaces
                        }
                      }
                      weight = preferred_during_scheduling_ignored_during_execution.value.weight
                    }
                  }
                  dynamic "required_during_scheduling_ignored_during_execution" {
                    for_each = pod_affinity.value.required_during_scheduling_ignored_during_execution_block[*]
                    content {
                      topology_key = required_during_scheduling_ignored_during_execution.value.topology_key
                      dynamic "label_selector" {
                        for_each = required_during_scheduling_ignored_during_execution.value.label_selector_block[*]
                        content {
                          dynamic "match_expressions" {
                            for_each = label_selector.value.match_expressions_blocks[*]
                            content {
                              key      = match_expressions.value.key
                              operator = match_expressions.value.operator
                              values   = match_expressions.value.values
                            }
                          }
                          match_labels = label_selector.value.match_labels
                        }
                      }
                      namespaces = required_during_scheduling_ignored_during_execution.value.namespaces
                    }
                  }
                }
              }

              dynamic "pod_anti_affinity" {
                for_each = affinity.value.pod_anti_affinity_block[*]
                content {
                  dynamic "preferred_during_scheduling_ignored_during_execution" {
                    for_each = pod_anti_affinity.value.preferred_during_scheduling_ignored_during_execution_blocks
                    content {
                      dynamic "pod_affinity_term" {
                        for_each = preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term_block[*]
                        content {
                          topology_key = pod_affinity_term.value.topology_key
                          dynamic "label_selector" {
                            for_each = pod_affinity_term.value.label_selector_block[*]
                            content {
                              dynamic "match_expressions" {
                                for_each = label_selector.value.match_expressions_blocks
                                content {
                                  key      = match_expressions.value.key
                                  operator = match_expressions.value.operator
                                  values   = match_expressions.value.values
                                }
                              }
                              match_labels = label_selector.value.match_labels
                            }
                          }
                          namespaces = pod_affinity_term.value.namespaces
                        }
                      }
                      weight = preferred_during_scheduling_ignored_during_execution.value.weight
                    }
                  }
                  dynamic "required_during_scheduling_ignored_during_execution" {
                    for_each = pod_anti_affinity.value.required_during_scheduling_ignored_during_execution_block[*]
                    content {
                      topology_key = required_during_scheduling_ignored_during_execution.value.topology_key
                      dynamic "label_selector" {
                        for_each = required_during_scheduling_ignored_during_execution.value.label_selector_block[*]
                        content {
                          dynamic "match_expressions" {
                            for_each = label_selector.value.match_expressions_blocks
                            content {
                              key      = match_expressions.value.key
                              operator = match_expressions.value.operator
                              values   = match_expressions.value.values
                            }
                          }
                          match_labels = label_selector.value.match_labels
                        }
                      }
                      namespaces = required_during_scheduling_ignored_during_execution.value.namespaces
                    }
                  }
                }
              }
            }
          }

          annotations = deployments.value.annotations

          dynamic "env" {
            for_each = deployments.value.env_block[*]
            content {
              container = env.value.container
              dynamic "env_vars" {
                for_each = env.value.env_vars_block[*]
                content {
                  name  = env_vars.value.name
                  value = env_vars.value.value
                  dynamic "value_from" {
                    for_each = env_vars.value.value_from_block[*]
                    content {
                      dynamic "config_map_key_ref" {
                        for_each = value_from.value.config_map_key_ref_block[*]
                        content {
                          key      = config_map_key_ref.value.key
                          name     = config_map_key_ref.value.name
                          optional = config_map_key_ref.value.optional
                        }
                      }
                      dynamic "field_ref" {
                        for_each = value_from.value.field_ref_block[*]
                        content {
                          field_path  = field_ref.value.field_path
                          api_version = field_ref.value.api_version
                        }
                      }
                      dynamic "resource_field_ref" {
                        for_each = value_from.value.resource_field_ref_block[*]
                        content {
                          resource       = resource_field_ref.value.resource
                          container_name = resource_field_ref.value.container_name
                          divisor        = resource_field_ref.value.divisor
                        }
                      }
                      dynamic "secret_key_ref" {
                        for_each = value_from.value.secret_key_ref_block[*]
                        content {
                          key      = secret_key_ref.value.key
                          name     = secret_key_ref.value.name
                          optional = secret_key_ref.value.optional
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          host_network = deployments.value.host_network
          labels       = deployments.value.labels

          dynamic "liveness_probes" {
            for_each = deployments.value.liveness_probes_block[*]
            content {
              container                        = liveness_probes.value.container
              failure_threshold                = liveness_probes.value.failure_threshold
              initial_delay_seconds            = liveness_probes.value.initial_delay_seconds
              period_seconds                   = liveness_probes.value.period_seconds
              success_threshold                = liveness_probes.value.success_threshold
              termination_grace_period_seconds = liveness_probes.value.termination_grace_period_seconds
              timeout_seconds                  = liveness_probes.value.timeout_seconds
            }
          }

          name          = deployments.value.name
          node_selector = deployments.value.node_selector

          dynamic "readiness_probes" {
            for_each = deployments.value.readiness_probes_blocks
            content {
              container                        = readiness_probes.value.container
              failure_threshold                = readiness_probes.value.failure_threshold
              initial_delay_seconds            = readiness_probes.value.initial_delay_seconds
              period_seconds                   = readiness_probes.value.period_seconds
              success_threshold                = readiness_probes.value.success_threshold
              termination_grace_period_seconds = readiness_probes.value.termination_grace_period_seconds
              timeout_seconds                  = readiness_probes.value.timeout_seconds
            }
          }

          replicas = deployments.value.replicas

          dynamic "resources" {
            for_each = deployments.value.resources_blocks
            content {
              container = resources.value.container
              dynamic "limits" {
                for_each = resources.value.limits_block[*]
                content {
                  cpu    = limits.value.cpu
                  memory = limits.value.memory
                }
              }
              dynamic "requests" {
                for_each = resources.value.requests_block[*]
                content {
                  cpu    = requests.value.cpu
                  memory = requests.value.memory
                }
              }
            }
          }

          dynamic "tolerations" {
            for_each = deployments.value.tolerations_blocks
            content {
              effect             = tolerations.value.effect
              key                = tolerations.value.key
              operator           = tolerations.value.operator
              toleration_seconds = tolerations.value.toleration_seconds
              value              = tolerations.value.value
            }
          }

          dynamic "topology_spread_constraints" {
            for_each = deployments.value.topology_spread_constraints_blocks
            content {
              max_skew           = topology_spread_constraints.value.max_skew
              topology_key       = topology_spread_constraints.value.topology_key
              when_unsatisfiable = topology_spread_constraints.value.when_unsatisfiable
              dynamic "label_selector" {
                for_each = topology_spread_constraints.value.label_selector_block[*]
                content {
                  dynamic "match_expressions" {
                    for_each = label_selector.value.match_expressions_blocks
                    content {
                      key      = match_expressions.value.key
                      operator = match_expressions.value.operator
                      values   = match_expressions.value.values
                    }
                  }
                  match_labels = label_selector.value.match_labels
                }
              }
            }
          }
        }
      }

      dynamic "high_availability" {
        for_each = spec.value.high_availability_block[*]
        content {
          replicas = high_availability.value.replicas
        }
      }

      dynamic "manifests" {
        for_each = spec.value.manifests_blocks
        content {
          url = manifests.value.url
        }
      }

      dynamic "pod_disruption_budgets" {
        for_each = spec.value.pod_disruption_budgets_blocks
        content {
          max_unavailable = pod_disruption_budgets.value.max_unavailable
          min_available   = pod_disruption_budgets.value.min_available
          name            = pod_disruption_budgets.value.name
        }
      }

      dynamic "registry" {
        for_each = spec.value.registry_block[*]
        content {
          default = registry.value.default
          dynamic "image_pull_secrets" {
            for_each = registry.value.image_pull_secrets_blocks
            content {
              name = image_pull_secrets.value.name
            }
          }
          override = registry.value.override
        }
      }

      dynamic "services" {
        for_each = spec.value.services_blocks
        content {
          annotations = services.value.annotations
          labels      = services.value.labels
          name        = services.value.name
          selector    = services.value.selector
        }
      }

      sink_binding_selection_mode = spec.value.sink_binding_selection_mode

      dynamic "source" {
        for_each = spec.value.source_block[*]
        content {
          dynamic "ceph" {
            for_each = source.value.ceph_block[*]
            content {
              enabled = ceph.value.enabled
            }
          }
          dynamic "github" {
            for_each = source.value.github_block[*]
            content {
              enabled = github.value.enabled
            }
          }
          dynamic "gitlab" {
            for_each = source.value.gitlab_block[*]
            content {
              enabled = gitlab.value.enabled
            }
          }
          dynamic "kafka" {
            for_each = source.value.kafka_block[*]
            content {
              enabled = kafka.value.enabled
            }
          }
          dynamic "rabbitmq" {
            for_each = source.value.rabbitmq_block[*]
            content {
              enabled = rabbitmq.value.enabled
            }
          }
          dynamic "redis" {
            for_each = source.value.redis_block[*]
            content {
              enabled = redis.value.enabled
            }
          }
        }
      }

      version = spec.value.version

      dynamic "workloads" {
        for_each = spec.value.workloads_blocks
        content {
          dynamic "affinity" {
            for_each = workloads.value.affinity_blocks
            content {
              dynamic "node_affinity" {
                for_each = affinity.value.node_affinity_block[*]
                content {
                  dynamic "preferred_during_scheduling_ignored_during_execution" {
                    for_each = node_affinity.value.preferred_during_scheduling_ignored_during_execution_blocks
                    content {
                      dynamic "preference" {
                        for_each = preferred_during_scheduling_ignored_during_execution.value.preference_block[*]
                        content {
                          dynamic "match_expressions" {
                            for_each = preference.value.match_expressions_blocks
                            content {
                              key      = match_expressions.value.key
                              operator = match_expressions.value.operator
                              values   = match_expressions.value.values
                            }
                          }
                          dynamic "match_fields" {
                            for_each = preference.value.match_fields_blocks
                            content {
                              key      = match_fields.value.key
                              operator = match_fields.value.operator
                              values   = match_fields.value.values
                            }
                          }
                        }
                      }
                      weight = preferred_during_scheduling_ignored_during_execution.value.weight
                    }
                  }

                  dynamic "required_during_scheduling_ignored_during_execution" {
                    for_each = affinity.value.required_during_scheduling_ignored_during_execution_block[*]
                    content {
                      dynamic "node_selector_terms" {
                        for_each = required_during_scheduling_ignored_during_execution.value.node_selector_terms_blocks
                        content {
                          dynamic "match_expressions" {
                            for_each = node_selector_terms.value.match_expressions_blocks
                            content {
                              key      = match_expressions.value.key
                              operator = match_expressions.value.operator
                              values   = match_expressions.value.values
                            }
                          }

                          dynamic "match_fields" {
                            for_each = node_selector_terms.value.match_fields_blocks
                            content {
                              key      = match_fields.value.key
                              operator = match_fields.value.operator
                              values   = match_fields.value.values
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }

              dynamic "pod_affinity" {
                for_each = affinity.value.pod_affinity_block[*]
                content {
                  dynamic "preferred_during_scheduling_ignored_during_execution" {
                    for_each = pod_affinity.value.preferred_during_scheduling_ignored_during_execution_blocks
                    content {
                      dynamic "pod_affinity_term" {
                        for_each = preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term_block[*]
                        content {
                          topology_key = pod_affinity_term.value.topology_key
                          dynamic "label_selector" {
                            for_each = pod_affinity_term.value.label_selector_block[*]
                            content {
                              dynamic "match_expressions" {
                                for_each = label_selector.value.match_expressions_blocks
                                content {
                                  key      = match_expressions.value.key
                                  operator = match_expressions.value.operator
                                  values   = match_expressions.value.values
                                }
                              }
                              match_labels = label_selector.value.match_labels
                            }
                          }
                          namespaces = pod_affinity_term.value.namespaces
                        }
                      }
                      weight = preferred_during_scheduling_ignored_during_execution.value.weight
                    }
                  }
                  dynamic "required_during_scheduling_ignored_during_execution" {
                    for_each = pod_affinity.value.required_during_scheduling_ignored_during_execution_block[*]
                    content {
                      topology_key = required_during_scheduling_ignored_during_execution.value.topology_key
                      dynamic "label_selector" {
                        for_each = required_during_scheduling_ignored_during_execution.value.label_selector_block[*]
                        content {
                          dynamic "match_expressions" {
                            for_each = label_selector.value.match_expressions_blocks[*]
                            content {
                              key      = match_expressions.value.key
                              operator = match_expressions.value.operator
                              values   = match_expressions.value.values
                            }
                          }
                          match_labels = label_selector.value.match_labels
                        }
                      }
                      namespaces = required_during_scheduling_ignored_during_execution.value.namespaces
                    }
                  }
                }
              }

              dynamic "pod_anti_affinity" {
                for_each = affinity.value.pod_anti_affinity_block[*]
                content {
                  dynamic "preferred_during_scheduling_ignored_during_execution" {
                    for_each = pod_anti_affinity.value.preferred_during_scheduling_ignored_during_execution_blocks
                    content {
                      dynamic "pod_affinity_term" {
                        for_each = preferred_during_scheduling_ignored_during_execution.value.pod_affinity_term_block[*]
                        content {
                          topology_key = pod_affinity_term.value.topology_key
                          dynamic "label_selector" {
                            for_each = pod_affinity_term.value.label_selector_block[*]
                            content {
                              dynamic "match_expressions" {
                                for_each = label_selector.value.match_expressions_blocks
                                content {
                                  key      = match_expressions.value.key
                                  operator = match_expressions.value.operator
                                  values   = match_expressions.value.values
                                }
                              }
                              match_labels = label_selector.value.match_labels
                            }
                          }
                          namespaces = pod_affinity_term.value.namespaces
                        }
                      }
                      weight = preferred_during_scheduling_ignored_during_execution.value.weight
                    }
                  }
                  dynamic "required_during_scheduling_ignored_during_execution" {
                    for_each = pod_anti_affinity.value.required_during_scheduling_ignored_during_execution_block[*]
                    content {
                      topology_key = required_during_scheduling_ignored_during_execution.value.topology_key
                      dynamic "label_selector" {
                        for_each = required_during_scheduling_ignored_during_execution.value.label_selector_block[*]
                        content {
                          dynamic "match_expressions" {
                            for_each = label_selector.value.match_expressions_blocks
                            content {
                              key      = match_expressions.value.key
                              operator = match_expressions.value.operator
                              values   = match_expressions.value.values
                            }
                          }
                          match_labels = label_selector.value.match_labels
                        }
                      }
                      namespaces = required_during_scheduling_ignored_during_execution.value.namespaces
                    }
                  }
                }
              }
            }
          }

          annotations = workloads.value.annotations

          dynamic "env" {
            for_each = workloads.value.env_block[*]
            content {
              container = env.value.container
              dynamic "env_vars" {
                for_each = env.value.env_vars_block[*]
                content {
                  name  = env_vars.value.name
                  value = env_vars.value.value
                  dynamic "value_from" {
                    for_each = env_vars.value.value_from_block[*]
                    content {
                      dynamic "config_map_key_ref" {
                        for_each = value_from.value.config_map_key_ref_block[*]
                        content {
                          key      = config_map_key_ref.value.key
                          name     = config_map_key_ref.value.name
                          optional = config_map_key_ref.value.optional
                        }
                      }
                      dynamic "field_ref" {
                        for_each = value_from.value.field_ref_block[*]
                        content {
                          field_path  = field_ref.value.field_path
                          api_version = field_ref.value.api_version
                        }
                      }
                      dynamic "resource_field_ref" {
                        for_each = value_from.value.resource_field_ref_block[*]
                        content {
                          resource       = resource_field_ref.value.resource
                          container_name = resource_field_ref.value.container_name
                          divisor        = resource_field_ref.value.divisor
                        }
                      }
                      dynamic "secret_key_ref" {
                        for_each = value_from.value.secret_key_ref_block[*]
                        content {
                          key      = secret_key_ref.value.key
                          name     = secret_key_ref.value.name
                          optional = secret_key_ref.value.optional
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          host_network = workloads.value.host_network
          labels       = workloads.value.labels

          dynamic "liveness_probes" {
            for_each = workloads.value.liveness_probes_block[*]
            content {
              container                        = liveness_probes.value.container
              failure_threshold                = liveness_probes.value.failure_threshold
              initial_delay_seconds            = liveness_probes.value.initial_delay_seconds
              period_seconds                   = liveness_probes.value.period_seconds
              success_threshold                = liveness_probes.value.success_threshold
              termination_grace_period_seconds = liveness_probes.value.termination_grace_period_seconds
              timeout_seconds                  = liveness_probes.value.timeout_seconds
            }
          }

          name          = workloads.value.name
          node_selector = workloads.value.node_selector

          dynamic "readiness_probes" {
            for_each = workloads.value.readiness_probes_blocks
            content {
              container                        = readiness_probes.value.container
              failure_threshold                = readiness_probes.value.failure_threshold
              initial_delay_seconds            = readiness_probes.value.initial_delay_seconds
              period_seconds                   = readiness_probes.value.period_seconds
              success_threshold                = readiness_probes.value.success_threshold
              termination_grace_period_seconds = readiness_probes.value.termination_grace_period_seconds
              timeout_seconds                  = readiness_probes.value.timeout_seconds
            }
          }

          replicas = workloads.value.replicas

          dynamic "resources" {
            for_each = workloads.value.resources_blocks
            content {
              container = resources.value.container
              dynamic "limits" {
                for_each = resources.value.limits_block[*]
                content {
                  cpu    = limits.value.cpu
                  memory = limits.value.memory
                }
              }
              dynamic "requests" {
                for_each = resources.value.requests_block[*]
                content {
                  cpu    = requests.value.cpu
                  memory = requests.value.memory
                }
              }
            }
          }

          dynamic "tolerations" {
            for_each = workloads.value.tolerations_blocks
            content {
              effect             = tolerations.value.effect
              key                = tolerations.value.key
              operator           = tolerations.value.operator
              toleration_seconds = tolerations.value.toleration_seconds
              value              = tolerations.value.value
            }
          }

          dynamic "topology_spread_constraints" {
            for_each = workloads.value.topology_spread_constraints_blocks
            content {
              max_skew           = topology_spread_constraints.value.max_skew
              topology_key       = topology_spread_constraints.value.topology_key
              when_unsatisfiable = topology_spread_constraints.value.when_unsatisfiable
              dynamic "label_selector" {
                for_each = topology_spread_constraints.value.label_selector_block[*]
                content {
                  dynamic "match_expressions" {
                    for_each = label_selector.value.match_expressions_blocks
                    content {
                      key      = match_expressions.value.key
                      operator = match_expressions.value.operator
                      values   = match_expressions.value.values
                    }
                  }
                  match_labels = label_selector.value.match_labels
                }
              }
            }
          }

          version = workloads.value.version

          dynamic "volume_mounts" {
            for_each = workloads.value.volume_mounts_blocks
            content {
              mount_path        = volume_mounts.value.mount_path
              name              = volume_mounts.value.name
              mount_propagation = volume_mounts.value.mount_propagation
              read_only         = volume_mounts.value.read_only
              sub_path          = volume_mounts.value.sub_path
              sub_path_expr     = volume_mounts.value.sub_path_expr
            }
          }
        }
      }
    }
  }
}