resource "kubernetes_deployment_v1" "deployment_v1" {
  dynamic "metadata" {
    for_each = var.metadata_block[*]
    content {
      annotations   = metadata.value.annotations
      generate_name = metadata.value.generate_name
      labels        = metadata.value.labels
      name          = metadata.value.name
      namespace     = metadata.value.namespace
    }
  }

  dynamic "spec" {
    for_each = var.spec_block[*]
    content {
      dynamic "template" {
        for_each = spec.value.template_block[*]
        content {
          dynamic "metadata" {
            for_each = template.value.metadata_block[*]
            content {
              annotations   = metadata.value.annotations
              generate_name = metadata.value.generate_name
              labels        = metadata.value.labels
              name          = metadata.value.name
              namespace     = metadata.value.namespace
            }
          }

          dynamic "spec" {
            for_each = template.value.spec_block[*]
            content {
              active_deadline_seconds = spec.value.active_deadline_seconds

              dynamic "affinity" {
                for_each = spec.value.affinity_block[*]
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

                          weight = 0
                        }
                      }

                      dynamic "required_during_scheduling_ignored_during_execution" {
                        for_each = node_affinity.value.required_during_scheduling_ignored_during_execution_block[*]
                        content {
                          dynamic "node_selector_term" {
                            for_each = required_during_scheduling_ignored_during_execution.value.node_selector_term_blocks
                            content {
                              dynamic "match_expressions" {
                                for_each = node_selector_term.value.match_expressions_blocks
                                content {
                                  key      = match_expressions.value.key
                                  operator = match_expressions.value.operator
                                  values   = match_expressions.value.values
                                }
                              }

                              dynamic "match_fields" {
                                for_each = node_selector_term.value.match_fields_blocks
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
                                for_each = pod_affinity_term.value.label_selector_blocks
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
                            for_each = required_during_scheduling_ignored_during_execution.value.label_selector_blocks
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
                                for_each = pod_affinity_term.value.label_selector_blocks
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
                            for_each = required_during_scheduling_ignored_during_execution.value.label_selector_blocks
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

              automount_service_account_token = spec.value.automount_service_account_token

              dynamic "container" {
                for_each = spec.value.container_blocks
                content {
                  name    = container.value.name
                  args    = container.value.args
                  command = container.value.command

                  dynamic "env" {
                    for_each = container.value.env_blocks
                    content {
                      name  = env.value.name
                      value = env.value.value

                      dynamic "value_from" {
                        for_each = env.value.value_from_block[*]
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
                              api_version = field_ref.value.api_version
                              field_path  = field_ref.value.field_path
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

                  dynamic "env_from" {
                    for_each = container.value.env_from_blocks
                    content {
                      dynamic "config_map_ref" {
                        for_each = env_from.value.config_map_ref_block[*]
                        content {
                          name     = config_map_ref.value.name
                          optional = config_map_ref.value.optional
                        }
                      }

                      prefix = env_from.value.prefix

                      dynamic "secret_ref" {
                        for_each = env_from.value.secret_ref_block[*]
                        content {
                          name     = secret_ref.value.name
                          optional = secret_ref.value.optional
                        }
                      }
                    }
                  }

                  image             = container.value.image
                  image_pull_policy = container.value.image_pull_policy

                  dynamic "lifecycle" {
                    for_each = container.value.lifecycle_block[*]
                    content {
                      dynamic "post_start" {
                        for_each = lifecycle.value.post_start_blocks
                        content {
                          dynamic "exec" {
                            for_each = post_start.value.exec_block[*]
                            content {
                              command = exec.value.command
                            }
                          }

                          dynamic "http_get" {
                            for_each = post_start.value.http_get_block[*]
                            content {
                              host = http_get.value.host

                              dynamic "http_header" {
                                for_each = http_get.value.http_header_blocks
                                content {
                                  name  = http_header.value.name
                                  value = http_header.value.value
                                }
                              }

                              path   = http_get.value.path
                              port   = http_get.value.port
                              scheme = http_get.value.scheme
                            }
                          }

                          dynamic "tcp_socket" {
                            for_each = post_start.value.tcp_socket_blocks
                            content {
                              port = tcp_socket.value.port
                            }
                          }
                        }
                      }

                      dynamic "pre_stop" {
                        for_each = lifecycle.value.pre_stop_blocks
                        content {
                          dynamic "exec" {
                            for_each = pre_stop.value.exec_block[*]
                            content {
                              command = exec.value.command
                            }
                          }

                          dynamic "http_get" {
                            for_each = pre_stop.value.http_get_block[*]
                            content {
                              host = http_get.value.host

                              dynamic "http_header" {
                                for_each = http_get.value.http_header_blocks
                                content {
                                  name  = http_header.value.name
                                  value = http_header.value.value
                                }
                              }

                              path   = http_get.value.path
                              port   = http_get.value.port
                              scheme = http_get.value.scheme
                            }
                          }

                          dynamic "tcp_socket" {
                            for_each = pre_stop.value.tcp_socket_blocks
                            content {
                              port = tcp_socket.value.port
                            }
                          }
                        }
                      }
                    }
                  }

                  dynamic "liveness_probe" {
                    for_each = container.value.liveness_probe_blocks
                    content {
                      dynamic "exec" {
                        for_each = liveness_probe.value.exec_block[*]
                        content {
                          command = exec.value.command
                        }
                      }

                      failure_threshold = liveness_probe.value.failure_threshold

                      dynamic "grpc" {
                        for_each = liveness_probe.value.grpc_blocks
                        content {
                          port    = grpc.value.port
                          service = grpc.value.service
                        }
                      }

                      dynamic "http_get" {
                        for_each = liveness_probe.value.http_get_block[*]
                        content {
                          host = http_get.value.host

                          dynamic "http_header" {
                            for_each = http_get.value.http_header_blocks
                            content {
                              name  = http_header.value.name
                              value = http_header.value.value
                            }
                          }

                          path   = http_get.value.path
                          port   = http_get.value.port
                          scheme = http_get.value.scheme
                        }
                      }

                      initial_delay_seconds = liveness_probe.value.initial_delay_seconds
                      period_seconds        = liveness_probe.value.period_seconds
                      success_threshold     = liveness_probe.value.success_threshold

                      dynamic "tcp_socket" {
                        for_each = liveness_probe.value.tcp_socket_blocks
                        content {
                          port = tcp_socket.value.port
                        }
                      }

                      timeout_seconds = liveness_probe.value.timeout_seconds
                    }
                  }

                  dynamic "port" {
                    for_each = container.value.port
                    content {
                      container_port = port.value.container_port
                      host_ip        = port.value.host_ip
                      name           = port.value.name
                      protocol       = port.value.protocol
                    }
                  }

                  dynamic "readiness_probe" {
                    for_each = container.value.readiness_probe_block[*]
                    content {
                      dynamic "exec" {
                        for_each = readiness_probe.value.exec_block[*]
                        content {
                          command = exec.value.command
                        }
                      }

                      failure_threshold = readiness_probe.value.failure_threshold

                      dynamic "grpc" {
                        for_each = readiness_probe.value.grpc_blocks
                        content {
                          port    = grpc.value.port
                          service = grpc.value.service
                        }
                      }

                      dynamic "http_get" {
                        for_each = readiness_probe.value.http_get_block[*]
                        content {
                          host = http_get.value.host

                          dynamic "http_header" {
                            for_each = http_get.value.http_header_blocks
                            content {
                              name  = http_header.value.name
                              value = http_header.value.value
                            }
                          }

                          path   = http_get.value.path
                          port   = http_get.value.port
                          scheme = http_get.value.scheme
                        }
                      }

                      initial_delay_seconds = readiness_probe.value.initial_delay_seconds
                      period_seconds        = readiness_probe.value.period_seconds
                      success_threshold     = readiness_probe.value.success_threshold

                      dynamic "tcp_socket" {
                        for_each = readiness_probe.value.tcp_socket_blocks
                        content {
                          port = tcp_socket.value.port
                        }
                      }

                      timeout_seconds = readiness_probe.value.timeout_seconds
                    }
                  }

                  dynamic "resources" {
                    for_each = container.value.resources_block[*]
                    content {
                      limits   = resources.value.limits
                      requests = resources.value.requests
                    }
                  }

                  dynamic "security_context" {
                    for_each = container.value.security_context_block[*]
                    content {
                      allow_privilege_escalation = security_context.value.allow_privilege_escalation

                      dynamic "capabilities" {
                        for_each = security_context.value.capabilities_block[*]
                        content {
                          add  = capabilities.value.add
                          drop = capabilities.value.drop
                        }
                      }

                      privileged                = security_context.value.privileged
                      read_only_root_filesystem = security_context.value.read_only_root_filesystem
                      run_as_group              = security_context.value.run_as_group
                      run_as_non_root           = security_context.value.run_as_non_root
                      run_as_user               = security_context.value.run_as_user

                      dynamic "se_linux_options" {
                        for_each = security_context.value.se_linux_options_block[*]
                        content {
                          level = se_linux_options.value.level
                          role  = se_linux_options.value.role
                          type  = se_linux_options.value.type
                          user  = se_linux_options.value.user
                        }
                      }

                      dynamic "seccomp_profile" {
                        for_each = security_context.value.seccomp_profile_block[*]
                        content {
                          localhost_profile = seccomp_profile.value.localhost_profile
                          type              = seccomp_profile.value.type
                        }
                      }
                    }
                  }

                  dynamic "startup_probe" {
                    for_each = container.value.lifecycle_block[*]
                    content {
                      dynamic "exec" {
                        for_each = startup_probe.value.exec_block[*]
                        content {
                          command = exec.value.command
                        }
                      }

                      failure_threshold = startup_probe.value.failure_threshold

                      dynamic "grpc" {
                        for_each = startup_probe.value.grpc_blocks
                        content {
                          port    = grpc.value.port
                          service = grpc.value.service
                        }
                      }

                      dynamic "http_get" {
                        for_each = startup_probe.value.http_get_block[*]
                        content {
                          host = http_get.value.host

                          dynamic "http_header" {
                            for_each = http_get.value.http_header_blocks
                            content {
                              name  = http_header.value.name
                              value = http_header.value.value
                            }
                          }

                          path   = http_get.value.path
                          port   = http_get.value.port
                          scheme = http_get.value.scheme
                        }
                      }

                      initial_delay_seconds = startup_probe.value.initial_delay_seconds
                      period_seconds        = startup_probe.value.period_seconds
                      success_threshold     = startup_probe.value.success_threshold

                      dynamic "tcp_socket" {
                        for_each = startup_probe.value.tcp_socket_blocks
                        content {
                          port = tcp_socket.value.port
                        }
                      }

                      timeout_seconds = startup_probe.value.timeout_seconds
                    }
                  }

                  stdin                      = container.value.stdin
                  stdin_once                 = container.value.stdin_once
                  termination_message_path   = container.value.termination_message_path
                  termination_message_policy = container.value.termination_message_policy
                  tty                        = container.value.tty

                  dynamic "volume_mount" {
                    for_each = container.value.volume_mount_blocks
                    content {
                      mount_path        = volume_mount.value.mount_path
                      name              = volume_mount.value.name
                      mount_propagation = volume_mount.value.mount_propagation
                      read_only         = volume_mount.value.read_only
                      sub_path          = volume_mount.value.sub_path
                    }
                  }

                  working_dir = container.value.working_dir
                }
              }

              dynamic "dns_config" {
                for_each = spec.value.dns_config_block[*]
                content {
                  nameservers = dns_config.value.nameservers

                  dynamic "option" {
                    for_each = dns_config.value.option_blocks
                    content {
                      name  = option.value.name
                      value = option.value.value
                    }
                  }
                  searches = dns_config.value.searches
                }
              }

              dns_policy           = spec.value.dns_policy
              enable_service_links = spec.value.enable_service_links

              dynamic "host_aliases" {
                for_each = spec.value.host_aliases_blocks
                content {
                  hostnames = host_aliases.value.hostnames
                  ip        = host_aliases.value.ip
                }
              }

              host_ipc     = spec.value.host_ipc
              host_network = spec.value.host_network
              host_pid     = spec.value.host_pid
              hostname     = spec.value.hostname

              dynamic "image_pull_secrets" {
                for_each = spec.value.image_pull_secrets_blocks
                content {
                  name = image_pull_secrets.value.name
                }
              }

              dynamic "init_container" {
                for_each = spec.value.init_container_blocks
                content {
                  name    = init_container.value.name
                  args    = init_container.value.args
                  command = init_container.value.command

                  dynamic "env" {
                    for_each = init_container.value.env_blocks
                    content {
                      name  = env.value.name
                      value = env.value.value

                      dynamic "value_from" {
                        for_each = env.value.value_from_block[*]
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
                              api_version = field_ref.value.api_version
                              field_path  = field_ref.value.field_path
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

                  dynamic "env_from" {
                    for_each = init_container.value.env_from_blocks
                    content {
                      dynamic "config_map_ref" {
                        for_each = env_from.value.config_map_ref_block[*]
                        content {
                          name     = config_map_ref.value.name
                          optional = config_map_ref.value.optional
                        }
                      }

                      prefix = env_from.value.prefix

                      dynamic "secret_ref" {
                        for_each = env_from.value.secret_ref_block[*]
                        content {
                          name     = secret_ref.value.name
                          optional = secret_ref.value.optional
                        }
                      }
                    }
                  }

                  image             = init_container.value.image
                  image_pull_policy = init_container.value.image_pull_policy

                  dynamic "lifecycle" {
                    for_each = init_container.value.lifecycle_block[*]
                    content {
                      dynamic "post_start" {
                        for_each = lifecycle.value.post_start_blocks
                        content {
                          dynamic "exec" {
                            for_each = post_start.value.exec_block[*]
                            content {
                              command = exec.value.command
                            }
                          }

                          dynamic "http_get" {
                            for_each = post_start.value.http_get_block[*]
                            content {
                              host = http_get.value.host

                              dynamic "http_header" {
                                for_each = http_get.value.http_header_blocks
                                content {
                                  name  = http_header.value.name
                                  value = http_header.value.value
                                }
                              }

                              path   = http_get.value.path
                              port   = http_get.value.port
                              scheme = http_get.value.scheme
                            }
                          }

                          dynamic "tcp_socket" {
                            for_each = post_start.value.tcp_socket_blocks
                            content {
                              port = tcp_socket.value.port
                            }
                          }
                        }
                      }

                      dynamic "pre_stop" {
                        for_each = lifecycle.value.pre_stop_blocks
                        content {
                          dynamic "exec" {
                            for_each = pre_stop.value.exec_block[*]
                            content {
                              command = exec.value.command
                            }
                          }

                          dynamic "http_get" {
                            for_each = pre_stop.value.http_get_block[*]
                            content {
                              host = http_get.value.host

                              dynamic "http_header" {
                                for_each = http_get.value.http_header_blocks
                                content {
                                  name  = http_header.value.name
                                  value = http_header.value.value
                                }
                              }

                              path   = http_get.value.path
                              port   = http_get.value.port
                              scheme = http_get.value.scheme
                            }
                          }

                          dynamic "tcp_socket" {
                            for_each = pre_stop.value.tcp_socket_blocks
                            content {
                              port = tcp_socket.value.port
                            }
                          }
                        }
                      }
                    }
                  }

                  dynamic "liveness_probe" {
                    for_each = init_container.value.liveness_probe_blocks
                    content {
                      dynamic "exec" {
                        for_each = liveness_probe.value.exec_block[*]
                        content {
                          command = exec.value.command
                        }
                      }

                      failure_threshold = liveness_probe.value.failure_threshold
                      dynamic "grpc" {
                        for_each = liveness_probe.value.grpc_blocks
                        content {
                          port    = grpc.value.port
                          service = grpc.value.service
                        }
                      }

                      dynamic "http_get" {
                        for_each = liveness_probe.value.http_get_block[*]
                        content {
                          host = http_get.value.host
                          dynamic "http_header" {
                            for_each = http_get.value.http_header_blocks
                            content {
                              name  = http_header.value.name
                              value = http_header.value.value
                            }
                          }

                          path   = http_get.value.path
                          port   = http_get.value.port
                          scheme = http_get.value.scheme
                        }
                      }

                      initial_delay_seconds = liveness_probe.value.initial_delay_seconds
                      period_seconds        = liveness_probe.value.period_seconds
                      success_threshold     = liveness_probe.value.success_threshold

                      dynamic "tcp_socket" {
                        for_each = liveness_probe.value.tcp_socket_blocks
                        content {
                          port = tcp_socket.value.port
                        }
                      }

                      timeout_seconds = liveness_probe.value.timeout_seconds
                    }
                  }

                  dynamic "port" {
                    for_each = init_container.value.port
                    content {
                      container_port = port.value.container_port
                      host_ip        = port.value.host_ip
                      name           = port.value.name
                      protocol       = port.value.protocol
                    }
                  }

                  dynamic "readiness_probe" {
                    for_each = init_container.value.readiness_probe_block[*]
                    content {
                      dynamic "exec" {
                        for_each = readiness_probe.value.exec_block[*]
                        content {
                          command = exec.value.command
                        }
                      }

                      failure_threshold = readiness_probe.value.failure_threshold

                      dynamic "grpc" {
                        for_each = readiness_probe.value.grpc_blocks
                        content {
                          port    = grpc.value.port
                          service = grpc.value.service
                        }
                      }

                      dynamic "http_get" {
                        for_each = readiness_probe.value.http_get_block[*]
                        content {
                          host = http_get.value.host
                          dynamic "http_header" {
                            for_each = http_get.value.http_header_blocks
                            content {
                              name  = http_header.value.name
                              value = http_header.value.value
                            }
                          }

                          path   = http_get.value.path
                          port   = http_get.value.port
                          scheme = http_get.value.scheme
                        }
                      }

                      initial_delay_seconds = readiness_probe.value.initial_delay_seconds
                      period_seconds        = readiness_probe.value.period_seconds
                      success_threshold     = readiness_probe.value.success_threshold

                      dynamic "tcp_socket" {
                        for_each = readiness_probe.value.tcp_socket_blocks
                        content {
                          port = tcp_socket.value.port
                        }
                      }

                      timeout_seconds = readiness_probe.value.timeout_seconds
                    }
                  }

                  dynamic "resources" {
                    for_each = init_container.value.resources_block[*]
                    content {
                      limits   = resources.value.limits
                      requests = resources.value.requests
                    }
                  }

                  dynamic "security_context" {
                    for_each = init_container.value.security_context_block[*]
                    content {
                      allow_privilege_escalation = security_context.value.allow_privilege_escalation

                      dynamic "capabilities" {
                        for_each = security_context.value.capabilities_block[*]
                        content {
                          add  = capabilities.value.add
                          drop = capabilities.value.drop
                        }
                      }

                      privileged                = security_context.value.privileged
                      read_only_root_filesystem = security_context.value.read_only_root_filesystem
                      run_as_group              = security_context.value.run_as_group
                      run_as_non_root           = security_context.value.run_as_non_root
                      run_as_user               = security_context.value.run_as_user

                      dynamic "se_linux_options" {
                        for_each = security_context.value.se_linux_options_block[*]
                        content {
                          level = se_linux_options.value.level
                          role  = se_linux_options.value.role
                          type  = se_linux_options.value.type
                          user  = se_linux_options.value.user
                        }
                      }

                      dynamic "seccomp_profile" {
                        for_each = security_context.value.seccomp_profile_block[*]
                        content {
                          localhost_profile = seccomp_profile.value.localhost_profile
                          type              = seccomp_profile.value.type
                        }
                      }
                    }
                  }

                  dynamic "startup_probe" {
                    for_each = init_container.value.lifecycle_block[*]
                    content {
                      dynamic "exec" {
                        for_each = startup_probe.value.exec_block[*]
                        content {
                          command = exec.value.command
                        }
                      }

                      failure_threshold = startup_probe.value.failure_threshold

                      dynamic "grpc" {
                        for_each = startup_probe.value.grpc_blocks
                        content {
                          port    = grpc.value.port
                          service = grpc.value.service
                        }
                      }

                      dynamic "http_get" {
                        for_each = startup_probe.value.http_get_block[*]
                        content {
                          host = http_get.value.host

                          dynamic "http_header" {
                            for_each = http_get.value.http_header_blocks
                            content {
                              name  = http_header.value.name
                              value = http_header.value.value
                            }
                          }

                          path   = http_get.value.path
                          port   = http_get.value.port
                          scheme = http_get.value.scheme
                        }
                      }

                      initial_delay_seconds = startup_probe.value.initial_delay_seconds
                      period_seconds        = startup_probe.value.period_seconds
                      success_threshold     = startup_probe.value.success_threshold

                      dynamic "tcp_socket" {
                        for_each = startup_probe.value.tcp_socket_blocks
                        content {
                          port = tcp_socket.value.port
                        }
                      }
                      timeout_seconds = startup_probe.value.timeout_seconds
                    }
                  }

                  stdin                      = init_container.value.stdin
                  stdin_once                 = init_container.value.stdin_once
                  termination_message_path   = init_container.value.termination_message_path
                  termination_message_policy = init_container.value.termination_message_policy
                  tty                        = init_container.value.tty

                  dynamic "volume_mount" {
                    for_each = init_container.value.volume_mount_blocks
                    content {
                      mount_path        = volume_mount.value.mount_path
                      name              = volume_mount.value.name
                      mount_propagation = volume_mount.value.mount_propagation
                      read_only         = volume_mount.value.read_only
                      sub_path          = volume_mount.value.sub_path
                    }
                  }

                  working_dir = init_container.value.working_dir
                }
              }

              node_name     = spec.value.node_name
              node_selector = spec.value.node_selector

              dynamic "os" {
                for_each = spec.value.os_block[*]
                content {
                  name = os.value.name
                }
              }

              priority_class_name = spec.value.priority_class_name

              dynamic "readiness_gate" {
                for_each = spec.value.readiness_gate_blocks
                content {
                  condition_type = readiness_gate.value.condition_type
                }
              }

              restart_policy     = spec.value.restart_policy
              runtime_class_name = spec.value.runtime_class_name
              scheduler_name     = spec.value.scheduler_name

              dynamic "security_context" {
                for_each = spec.value.security_context_block[*]
                content {
                  fs_group               = security_context.value.fs_group
                  fs_group_change_policy = security_context.value.fs_group_change_policy
                  run_as_group           = security_context.value.run_as_group
                  run_as_non_root        = security_context.value.run_as_non_root
                  run_as_user            = security_context.value.run_as_user

                  dynamic "seccomp_profile" {
                    for_each = security_context.value.seccomp_profile_block[*]
                    content {
                      localhost_profile = seccomp_profile.value.localhost_profile
                      type              = seccomp_profile.value.type
                    }
                  }

                  supplemental_groups = security_context.value.supplemental_groups

                  dynamic "sysctl" {
                    for_each = security_context.value.sysctl_blocks
                    content {
                      name  = sysctl.value.name
                      value = sysctl.value.value
                    }
                  }

                  dynamic "windows_options" {
                    for_each = security_context.value.windows_options_block[*]
                    content {
                      gmsa_credential_spec      = windows_options.value.gmsa_credential_spec
                      gmsa_credential_spec_name = windows_options.value.gmsa_credential_spec_name
                      host_process              = windows_options.value.host_process
                      run_as_username           = windows_options.value.run_as_username
                    }
                  }
                }
              }

              service_account_name             = spec.value.service_account_name
              share_process_namespace          = spec.value.share_process_namespace
              subdomain                        = spec.value.subdomain
              termination_grace_period_seconds = spec.value.termination_grace_period_seconds

              dynamic "toleration" {
                for_each = spec.value.toleration_blocks
                content {
                  effect             = toleration.value.effect
                  key                = toleration.value.key
                  operator           = toleration.value.operator
                  toleration_seconds = toleration.value.toleration_seconds
                  value              = toleration.value.value
                }
              }

              dynamic "topology_spread_constraint" {
                for_each = spec.value.topology_spread_constraint_blocks
                content {
                  dynamic "label_selector" {
                    for_each = topology_spread_constraint.value.label_selector_blocks
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

                  match_label_keys     = topology_spread_constraint.value.match_label_keys
                  max_skew             = topology_spread_constraint.value.max_skew
                  min_domains          = topology_spread_constraint.value.min_domains
                  node_affinity_policy = topology_spread_constraint.value.node_affinity_policy
                  node_taints_policy   = topology_spread_constraint.value.node_taints_policy
                  topology_key         = topology_spread_constraint.value.topology_key
                  when_unsatisfiable   = topology_spread_constraint.value.when_unsatisfiable
                }
              }

              dynamic "volume" {
                for_each = spec.value.volume_blocks
                content {
                  dynamic "aws_elastic_block_store" {
                    for_each = volume.value.aws_elastic_block_store_block[*]
                    content {
                      volume_id = aws_elastic_block_store.value.volume_id
                      fs_type   = aws_elastic_block_store.value.fs_type
                      partition = aws_elastic_block_store.value.partition
                      read_only = aws_elastic_block_store.value.read_only
                    }
                  }

                  dynamic "azure_disk" {
                    for_each = volume.value.azure_disk_block[*]
                    content {
                      caching_mode  = azure_disk.value.caching_mode
                      data_disk_uri = azure_disk.value.data_disk_uri
                      disk_name     = azure_disk.value.disk_name
                      fs_type       = azure_disk.value.fs_type
                      kind          = azure_disk.value.kind
                      read_only     = azure_disk.value.read_only
                    }
                  }

                  dynamic "azure_file" {
                    for_each = volume.value.azure_file_block[*]
                    content {
                      secret_name      = azure_file.value.secret_name
                      share_name       = azure_file.value.share_name
                      read_only        = azure_file.value.read_only
                      secret_namespace = azure_file.value.secret_namespace
                    }
                  }

                  dynamic "ceph_fs" {
                    for_each = volume.value.ceph_fs_block[*]
                    content {
                      monitors    = ceph_fs.value.monitors
                      path        = ceph_fs.value.path
                      read_only   = ceph_fs.value.read_only
                      secret_file = ceph_fs.value.secret_file

                      dynamic "secret_ref" {
                        for_each = ceph_fs.value.secret_ref_block[*]
                        content {
                          name      = secret_ref.value.name
                          namespace = secret_ref.value.namespace
                        }
                      }

                      user = ceph_fs.value.user
                    }
                  }

                  dynamic "cinder" {
                    for_each = volume.value.cinder_block[*]
                    content {
                      volume_id = cinder.value.volume_id
                      fs_type   = cinder.value.fs_type
                      read_only = cinder.value.read_only
                    }
                  }

                  dynamic "config_map" {
                    for_each = volume.value.config_map_block[*]
                    content {
                      default_mode = config_map.value.default_mode

                      dynamic "items" {
                        for_each = config_map.value.items_blocks
                        content {
                          key  = items.value.key
                          mode = items.value.mode
                          path = items.value.path
                        }
                      }

                      name     = config_map.value.name
                      optional = config_map.value.optional
                    }
                  }

                  dynamic "csi" {
                    for_each = volume.value.csi_block[*]
                    content {
                      driver  = csi.value.driver
                      fs_type = csi.value.fs_type

                      dynamic "node_publish_secret_ref" {
                        for_each = csi.value.node_publish_secret_ref_block[*]
                        content {
                          name = node_publish_secret_ref.value.name
                        }
                      }

                      read_only         = csi.value.read_only
                      volume_attributes = csi.value.volume_attributes
                    }
                  }

                  dynamic "downward_api" {
                    for_each = volume.value.downward_api_block[*]
                    content {
                      default_mode = downward_api.value.default_mode

                      dynamic "items" {
                        for_each = downward_api.value.items_blocks
                        content {
                          dynamic "field_ref" {
                            for_each = items.value.field_ref_object
                            content {
                              api_version = field_ref.value.api_version
                              field_path  = field_ref.value.field_path
                            }
                          }

                          path = items.value.path
                          mode = items.value.mode

                          dynamic "resource_field_ref" {
                            for_each = items.value.resource_field_ref_block[*]
                            content {
                              container_name = resource_field_ref.value.container_name
                              resource       = resource_field_ref.value.resource
                              divisor        = resource_field_ref.value.divisor
                            }
                          }
                        }
                      }
                    }
                  }

                  dynamic "empty_dir" {
                    for_each = volume.value.empty_dir_block[*]
                    content {
                      medium     = empty_dir.value.medium
                      size_limit = empty_dir.value.size_limit
                    }
                  }

                  dynamic "ephemeral" {
                    for_each = volume.value.ephemeral_block[*]
                    content {
                      dynamic "volume_claim_template" {
                        for_each = ephemeral.value.volume_claim_template_block[*]
                        content {
                          dynamic "spec" {
                            for_each = volume_claim_template.value.spec_block[*]
                            content {
                              access_modes = spec.value.access_modes

                              dynamic "resources" {
                                for_each = spec.value.resources_block[*]
                                content {
                                  limits   = resources.value.limits
                                  requests = resources.value.requests
                                }
                              }

                              dynamic "selector" {
                                for_each = spec.value.selector_block[*]
                                content {
                                  dynamic "match_expressions" {
                                    for_each = selector.value.match_expressions_blocks
                                    content {
                                      key      = match_expressions.value.key
                                      operator = match_expressions.value.operator
                                      values   = match_expressions.value.values
                                    }
                                  }
                                  match_labels = selector.value.match_labels
                                }
                              }

                              storage_class_name = optional(string)
                              volume_mode = optional(string)
                              volume_name = optional(string)
                            }
                          }

                          dynamic "metadata" {
                            for_each = volume_claim_template.value.metadata_block[*]
                            content {
                              annotations = metadata.value.annotations
                              labels      = metadata.value.labels
                            }
                          }
                        }
                      }
                    }
                  }

                  dynamic "fc" {
                    for_each = volume.value.fc_block[*]
                    content {
                      lun          = fc.value.lun
                      target_ww_ns = fc.value.target_ww_ns
                      fs_type      = fc.value.fs_type
                      read_only    = fc.value.read_only
                    }
                  }

                  dynamic "flex_volume" {
                    for_each = volume.value.flex_volume_block[*]
                    content {
                      driver    = flex_volume.value.driver
                      fs_type   = flex_volume.value.fs_type
                      options   = flex_volume.value.options
                      read_only = flex_volume.value.read_only

                      dynamic "secret_ref" {
                        for_each = flex_volume.value.secret_ref_block[*]
                        content {
                          name      = secret_ref.value.name
                          namespace = secret_ref.value.namespace
                        }
                      }
                    }
                  }

                  dynamic "flocker" {
                    for_each = volume.value.flocker_block[*]
                    content {
                      dataset_name = flocker.value.dataset_name
                      dataset_uuid = flocker.value.dataset_uuid
                    }
                  }

                  dynamic "gce_persistent_disk" {
                    for_each = volume.value.gce_persistent_disk_block[*]
                    content {
                      pd_name   = gce_persistent_disk.value.pd_name
                      fs_type   = gce_persistent_disk.value.fs_type
                      partition = gce_persistent_disk.value.partition
                      read_only = gce_persistent_disk.value.read_only
                    }
                  }

                  dynamic "git_repo" {
                    for_each = volume.value.git_repo_block[*]
                    content {
                      directory  = git_repo.value.directory
                      repository = git_repo.value.repository
                      revision   = git_repo.value.revision
                    }
                  }

                  dynamic "glusterfs" {
                    for_each = volume.value.glusterfs_block[*]
                    content {
                      endpoints_name = glusterfs.value.endpoints_name
                      path           = glusterfs.value.path
                      read_only      = glusterfs.value.read_only
                    }
                  }

                  dynamic "host_path" {
                    for_each = volume.value.host_path_block[*]
                    content {
                      path = host_path.value.path
                      type = host_path.value.type
                    }
                  }

                  dynamic "iscsi" {
                    for_each = volume.value.iscsi_block[*]
                    content {
                      iqn             = iscsi.value.iqn
                      target_portal   = iscsi.value.target_portal
                      fs_type         = iscsi.value.fs_type
                      iscsi_interface = iscsi.value.iscsi_interface
                      lun             = iscsi.value.lun
                      read_only       = iscsi.value.read_only
                    }
                  }

                  dynamic "local" {
                    for_each = volume.value.local_block[*]
                    content {
                      path = local.value.path
                    }
                  }

                  name = volume.value.name

                  dynamic "nfs" {
                    for_each = volume.value.nfs_block[*]
                    content {
                      path      = nfs.value.path
                      server    = nfs.value.server
                      read_only = nfs.value.read_only
                    }
                  }

                  dynamic "persistent_volume_claim" {
                    for_each = volume.value.persistent_volume_claim_block[*]
                    content {
                      claim_name = persistent_volume_claim.value.claim_name
                      read_only  = persistent_volume_claim.value.read_only
                    }
                  }

                  dynamic "photon_persistent_disk" {
                    for_each = volume.value.photon_persistent_disk_block[*]
                    content {
                      pd_id   = photon_persistent_disk.value.pd_id
                      fs_type = photon_persistent_disk.value.fs_type
                    }
                  }

                  dynamic "projected" {
                    for_each = volume.value.projected_blocks
                    content {
                      dynamic "sources" {
                        for_each = projected.value.sources_block[*]
                        content {
                          dynamic "config_map" {
                            for_each = sources.value.config_map_blocks
                            content {
                              dynamic "items" {
                                for_each = config_map.value.items_blocks
                                content {
                                  key  = items.value.key
                                  mode = items.value.mode
                                  path = items.value.path
                                }
                              }
                              name     = config_map.value.name
                              optional = config_map.value.optional
                            }
                          }

                          dynamic "downward_api" {
                            for_each = sources.value.downward_api_block[*]
                            content {
                              dynamic "items" {
                                for_each = downward_api.value.items_blocks
                                content {
                                  path = items.value.path

                                  dynamic "field_ref" {
                                    for_each = sources.value.field_ref_block[*]
                                    content {
                                      api_version = field_ref.value.api_version
                                      field_path  = field_ref.value.field_path
                                    }
                                  }

                                  mode = items.value.mode

                                  dynamic "resource_field_ref" {
                                    for_each = sources.value.resource_field_ref_block[*]
                                    content {
                                      container_name = resource_field_ref.value.container_name
                                      resource       = resource_field_ref.value.resource
                                      divisor        = resource_field_ref.value.divisor
                                    }
                                  }
                                }
                              }
                            }
                          }

                          dynamic "secret" {
                            for_each = sources.value.secret_blocks
                            content {
                              dynamic "items" {
                                for_each = secret.value.items_blocks
                                content {
                                  key  = items.value.key
                                  mode = items.value.mode
                                  path = items.value.path
                                }
                              }

                              name     = secret.value.name
                              optional = secret.value.optional
                            }
                          }

                          dynamic "service_account_token" {
                            for_each = sources.value.service_account_token_block[*]
                            content {
                              path               = service_account_token.value.path
                              audience           = service_account_token.value.audience
                              expiration_seconds = service_account_token.value.expiration_seconds
                            }
                          }
                        }
                      }

                      default_mode = projected.value.default_mode
                    }
                  }

                  dynamic "quobyte" {
                    for_each = volume.value.quobyte_block[*]
                    content {
                      registry  = quobyte.value.registry
                      volume    = quobyte.value.volume
                      group     = quobyte.value.group
                      read_only = quobyte.value.read_only
                      user      = quobyte.value.user
                    }
                  }

                  dynamic "rbd" {
                    for_each = volume.value.rbd_block[*]
                    content {
                      ceph_monitors = rbd.value.ceph_monitors
                      rbd_image     = rbd.value.rbd_image
                      fs_type       = rbd.value.fs_type
                      keyring       = rbd.value.keyring
                      rados_user    = rbd.value.rados_user
                      rbd_pool      = rbd.value.rbd_pool
                      read_only     = rbd.value.read_only

                      dynamic "secret_ref" {
                        for_each = volume.value.secret_ref_block[*]
                        content {
                          name      = secret_ref.value.name
                          namespace = secret_ref.value.namespace
                        }
                      }
                    }
                  }

                  dynamic "secret" {
                    for_each = volume.value.secret_block[*]
                    content {
                      default_mode = secret.value.default_mode

                      dynamic "items" {
                        for_each = secret.value.items_blocks
                        content {
                          key  = items.value.key
                          mode = items.value.mode
                          path = items.value.path
                        }
                      }

                      optional    = secret.value.optional
                      secret_name = secret.value.secret_name
                    }
                  }

                  dynamic "vsphere_volume" {
                    for_each = volume.value.vsphere_volume_block[*]
                    content {
                      volume_path = vsphere_volume.value.volume_path
                      fs_type     = vsphere_volume.value.fs_type
                    }
                  }
                }
              }
            }
          }
        }
      }

      min_ready_seconds         = spec.value.min_ready_seconds
      paused                    = spec.value.paused
      progress_deadline_seconds = spec.value.progress_deadline_seconds
      replicas                  = spec.value.replicas
      revision_history_limit    = spec.value.revision_history_limit

      dynamic "selector" {
        for_each = spec.value.selector_block[*]
        content {
          dynamic "match_expressions" {
            for_each = selector.value.match_expressions_blocks
            content {
              key      = match_expressions.value.key
              operator = match_expressions.value.operator
              values   = match_expressions.value.values
            }
          }

          match_labels = selector.value.match_labels
        }
      }

      dynamic "strategy" {
        for_each = spec.value.strategy_block[*]
        content {
          dynamic "rolling_update" {
            for_each = strategy.value.rolling_update_block[*]
            content {
              max_surge       = rolling_update.value.max_surge
              max_unavailable = rolling_update.value.max_unavailable
            }
          }

          type = strategy.value.type
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  wait_for_rollout = var.wait_for_rollout
}