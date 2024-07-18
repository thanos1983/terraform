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
                })), [])
                match_fields_blocks = optional(list(object({
                  key      = string
                  operator = string
                  values = optional(set(string))
                })), [])
              })
              weight = number
            })), [])
            required_during_scheduling_ignored_during_execution_block = optional(object({
              node_selector_term_blocks = optional(list(object({
                match_expressions_blocks = optional(list(object({
                  key = optional(string)
                  operator = optional(string)
                  values = optional(set(string))
                })), [])
                match_fields_blocks = optional(list(object({
                  key      = string
                  operator = string
                  values = optional(set(string))
                })), [])
              })))
            }), null)
          }), null)
          pod_affinity_block = optional(object({
            preferred_during_scheduling_ignored_during_execution_blocks = optional(list(object({
              pod_affinity_term_block = object({
                topology_key = string
                label_selector_blocks = optional(list(object({
                  match_expressions_blocks = optional(list(object({
                    key = optional(string)
                    operator = optional(string)
                    values = optional(set(string))
                  })), [])
                  match_labels = optional(map(string))
                })), [])
                namespaces = optional(set(string))
              })
              weight = number
            })), [])
            required_during_scheduling_ignored_during_execution_block = optional(object({
              topology_key = string
              label_selector_blocks = optional(list(object({
                match_expressions_blocks = optional(list(object({
                  key = optional(string)
                  operator = optional(string)
                  values = optional(set(string))
                })), [])
                match_labels = optional(map(string))
              })), [])
              namespaces = optional(set(string))
            }), null)
          }), null)
          pod_anti_affinity_block = optional(object({
            preferred_during_scheduling_ignored_during_execution_blocks = optional(list(object({
              pod_affinity_term_block = object({
                topology_key = string
                label_selector_blocks = optional(list(object({
                  match_expressions_blocks = optional(list(object({
                    key = optional(string)
                    operator = optional(string)
                    values = optional(set(string))
                  })), [])
                  match_labels = optional(map(string))
                })), [])
                namespaces = optional(set(string))
              })
              weight = number
            })), [])
            required_during_scheduling_ignored_during_execution_block = optional(object({
              topology_key = string
              label_selector_blocks = optional(list(object({
                match_expressions_blocks = optional(list(object({
                  key = optional(string)
                  operator = optional(string)
                  values = optional(set(string))
                })), [])
                match_labels = optional(map(string))
              })), [])
              namespaces = optional(set(string))
            }), null)
          }), null)
        }), null)
        automount_service_account_token = optional(bool)
        container_blocks = optional(list(object({
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
              }), null)
              field_ref_block = optional(object({
                api_version = optional(string)
                field_path = optional(string)
              }), null)
              resource_field_ref_block = optional(object({
                resource = string
                container_name = optional(string)
                divisor = optional(string)
              }), null)
              secret_key_ref_block = optional(object({
                key = optional(string)
                name = optional(string)
                optional = optional(bool)
              }), null)
            }), null)
          })), [])
          env_from_blocks = optional(list(object({
            config_map_ref_block = optional(object({
              name = string
              optional = optional(bool)
            }), null)
            prefix = optional(string)
            secret_ref_block = optional(object({
              name = string
              optional = optional(bool)
            }), null)
          })), [])
          image = optional(string)
          image_pull_policy = optional(string)
          lifecycle_block = optional(object({
            post_start_blocks = optional(list(object({
              exec_block = optional(object({
                command = optional(list(string))
              }), null)
              http_get_block = optional(object({
                host = optional(string)
                http_header_blocks = optional(list(object({
                  name = optional(string)
                  value = optional(string)
                })), [])
                path = optional(string)
                port = optional(string)
                scheme = optional(string)
              }), null)
              tcp_socket_blocks = optional(list(object({
                port = string
              })), [])
            })), [])
            pre_stop_blocks = optional(list(object({
              exec_block = optional(object({
                command = optional(list(string))
              }), null)
              http_get_block = optional(object({
                host = optional(string)
                http_header_blocks = optional(list(object({
                  name = optional(string)
                  value = optional(string)
                })), [])
                path = optional(string)
                port = optional(string)
                scheme = optional(string)
              }), null)
              tcp_socket_blocks = optional(list(object({
                port = string
              })), [])
            })), [])
          }), null)
          liveness_probe_blocks = optional(list(object({
            exec_block = optional(object({
              command = optional(list(string))
            }), null)
            failure_threshold = optional(number)
            grpc_blocks = optional(list(object({
              port = string
              service = optional(string)
            })), [])
            http_get_block = optional(object({
              host = optional(string)
              http_header_blocks = optional(list(object({
                name = optional(string)
                value = optional(string)
              })), [])
              path = optional(string)
              port = optional(string)
              scheme = optional(string)
            }), null)
            initial_delay_seconds = optional(number)
            period_seconds = optional(number)
            success_threshold = optional(number)
            tcp_socket_blocks = optional(list(object({
              port = string
            })), [])
            timeout_seconds = optional(number)
          })), [])
          port_blocks = optional(list(object({
            container_port = number
            host_ip = optional(string)
            host_port = optional(number)
            name = optional(string)
            protocol = optional(string)
          })), [])
          readiness_probe_block = optional(object({
            exec_block = optional(object({
              command = optional(list(string))
            }), null)
            failure_threshold = optional(number)
            grpc_blocks = optional(list(object({
              port = string
              service = optional(string)
            })), [])
            http_get_block = optional(object({
              host = optional(string)
              http_header_blocks = optional(list(object({
                name = optional(string)
                value = optional(string)
              })), [])
              path = optional(string)
              port = optional(string)
              scheme = optional(string)
            }), null)
            initial_delay_seconds = optional(number)
            period_seconds = optional(number)
            success_threshold = optional(number)
            tcp_socket_blocks = optional(list(object({
              port = string
            })), [])
            timeout_seconds = optional(number)
          }), null)
          resources_block = optional(object({
            limits = optional(map(string))
            requests = optional(map(string))
          }), null)
          security_context_block = optional(object({
            allow_privilege_escalation = optional(bool)
            capabilities_block = optional(object({
              add = optional(list(string))
              drop = optional(list(string))
            }), null)
            privileged = optional(bool)
            read_only_root_filesystem = optional(bool)
            run_as_group = optional(bool)
            run_as_non_root = optional(bool)
            run_as_user = optional(string)
            se_linux_options_block = optional(object({
              level = optional(string)
              role = optional(string)
              type = optional(string)
              user = optional(string)
            }), null)
            seccomp_profile_block = optional(object({
              localhost_profile = optional(string)
              type = optional(string)
            }), null)
          }), null)
          startup_probe_block = optional(object({
            exec_block = optional(object({
              command = optional(list(string))
            }), null)
            failure_threshold = optional(number)
            grpc_blocks = optional(list(object({
              port = string
              service = optional(string)
            })), [])
            http_get_block = optional(object({
              host = optional(string)
              http_header_blocks = optional(list(object({
                name = optional(string)
                value = optional(string)
              })), [])
              path = optional(string)
              port = optional(string)
              scheme = optional(string)
            }), null)
            initial_delay_seconds = optional(number)
            period_seconds = optional(number)
            success_threshold = optional(number)
            tcp_socket_blocks = optional(list(object({
              port = string
            })), [])
            timeout_seconds = optional(number)
          }), null)
          stdin = optional(bool)
          stdin_once = optional(bool)
          termination_message_path = optional(string)
          termination_message_policy = optional(string)
          tty = optional(bool)
          volume_mount_blocks = optional(list(object({
            mount_path = string
            name       = string
            mount_propagation = optional(string)
            read_only = optional(bool)
            sub_path = optional(string)
          })), [])
          working_dir = optional(string)
        })), [])
        dns_config_block = optional(object({
          nameservers = optional(list(string))
          option_blocks = optional(list(object({
            name = string
            value = optional(string)
          })), [])
          searches = optional(list(string))
        }), null)
        dns_policy = optional(string)
        enable_service_links = optional(bool)
        host_aliases_blocks = optional(list(object({
          hostnames = list(string)
          ip = string
        })), [])
        host_ipc = optional(bool)
        host_network = optional(bool)
        host_pid = optional(bool)
        hostname = optional(string)
        image_pull_secrets_blocks = optional(list(object({
          name = string
        })), [])
        init_container_blocks = optional(list(object({
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
              }), null)
              field_ref_block = optional(object({
                api_version = optional(string)
                field_path = optional(string)
              }), null)
              resource_field_ref_block = optional(object({
                resource = string
                container_name = optional(string)
                divisor = optional(string)
              }), null)
              secret_key_ref_block = optional(object({
                key = optional(string)
                name = optional(string)
                optional = optional(bool)
              }), null)
            }), null)
          })), [])
          env_from_blocks = optional(list(object({
            config_map_ref_block = optional(object({
              name = string
              optional = optional(bool)
            }), null)
            prefix = optional(string)
            secret_ref_block = optional(object({
              name = string
              optional = optional(bool)
            }), null)
          })), [])
          image = optional(string)
          image_pull_policy = optional(string)
          lifecycle_block = optional(object({
            post_start_blocks = optional(list(object({
              exec_block = optional(object({
                command = optional(list(string))
              }), null)
              http_get_block = optional(object({
                host = optional(string)
                http_header_blocks = optional(list(object({
                  name = optional(string)
                  value = optional(string)
                })), [])
                path = optional(string)
                port = optional(string)
                scheme = optional(string)
              }), null)
              tcp_socket_blocks = optional(list(object({
                port = string
              })), [])
            })), [])
            pre_stop_blocks = optional(list(object({
              exec_block = optional(object({
                command = optional(list(string))
              }), null)
              http_get_block = optional(object({
                host = optional(string)
                http_header_blocks = optional(list(object({
                  name = optional(string)
                  value = optional(string)
                })), [])
                path = optional(string)
                port = optional(string)
                scheme = optional(string)
              }), null)
              tcp_socket_blocks = optional(list(object({
                port = string
              })), [])
            })), [])
          }), null)
          liveness_probe_blocks = optional(list(object({
            exec_block = optional(object({
              command = optional(list(string))
            }), null)
            failure_threshold = optional(number)
            grpc_blocks = optional(list(object({
              port = string
              service = optional(string)
            })), [])
            http_get_block = optional(object({
              host = optional(string)
              http_header_blocks = optional(list(object({
                name = optional(string)
                value = optional(string)
              })), [])
              path = optional(string)
              port = optional(string)
              scheme = optional(string)
            }), null)
            initial_delay_seconds = optional(number)
            period_seconds = optional(number)
            success_threshold = optional(number)
            tcp_socket_blocks = optional(list(object({
              port = string
            })), [])
            timeout_seconds = optional(number)
          })), [])
          port_blocks = optional(list(object({
            container_port = number
            host_ip = optional(string)
            host_port = optional(number)
            name = optional(string)
            protocol = optional(string)
          })), [])
          readiness_probe_block = optional(object({
            exec_block = optional(object({
              command = optional(list(string))
            }), null)
            failure_threshold = optional(number)
            grpc_blocks = optional(list(object({
              port = string
              service = optional(string)
            })), [])
            http_get_block = optional(object({
              host = optional(string)
              http_header_blocks = optional(list(object({
                name = optional(string)
                value = optional(string)
              })), [])
              path = optional(string)
              port = optional(string)
              scheme = optional(string)
            }), null)
            initial_delay_seconds = optional(number)
            period_seconds = optional(number)
            success_threshold = optional(number)
            tcp_socket_blocks = optional(list(object({
              port = string
            })), [])
            timeout_seconds = optional(number)
          }), null)
          resources_block = optional(object({
            limits = optional(map(string))
            requests = optional(map(string))
          }), null)
          security_context_block = optional(object({
            allow_privilege_escalation = optional(bool)
            capabilities_block = optional(object({
              add = optional(list(string))
              drop = optional(list(string))
            }), null)
            privileged = optional(bool)
            read_only_root_filesystem = optional(bool)
            run_as_group = optional(bool)
            run_as_non_root = optional(bool)
            run_as_user = optional(string)
            se_linux_options_block = optional(object({
              level = optional(string)
              role = optional(string)
              type = optional(string)
              user = optional(string)
            }), null)
            seccomp_profile_block = optional(object({
              localhost_profile = optional(string)
              type = optional(string)
            }), null)
          }), null)
          startup_probe_block = optional(object({
            exec_block = optional(object({
              command = optional(list(string))
            }), null)
            failure_threshold = optional(number)
            grpc_blocks = optional(list(object({
              port = string
              service = optional(string)
            })), [])
            http_get_block = optional(object({
              host = optional(string)
              http_header_blocks = optional(list(object({
                name = optional(string)
                value = optional(string)
              })), [])
              path = optional(string)
              port = optional(string)
              scheme = optional(string)
            }), null)
            initial_delay_seconds = optional(number)
            period_seconds = optional(number)
            success_threshold = optional(number)
            tcp_socket_blocks = optional(list(object({
              port = string
            })), [])
            timeout_seconds = optional(number)
          }), null)
          stdin = optional(bool)
          stdin_once = optional(bool)
          termination_message_path = optional(string)
          termination_message_policy = optional(string)
          tty = optional(bool)
          volume_mount_blocks = optional(list(object({
            mount_path = string
            name       = string
            mount_propagation = optional(string)
            read_only = optional(bool)
            sub_path = optional(string)
          })), [])
          working_dir = optional(string)
        })), [])
        node_name = optional(string)
        node_selector = optional(map(string))
        os_block = optional(object({
          name = string
        }), null)
        priority_class_name = optional(string)
        readiness_gate_blocks = optional(list(object({
          condition_type = string
        })), [])
        restart_policy = optional(string)
        runtime_class_name = optional(string)
        scheduler_name = optional(string)
        security_context_block = optional(list(object({
          fs_group = optional(string)
          fs_group_change_policy = optional(string)
          run_as_group = optional(string)
          run_as_non_root = optional(bool)
          run_as_user = optional(string)
          se_linux_options = optional(object({
            level = optional(string)
            role = optional(string)
            type = optional(string)
            user = optional(string)
          }), null)
          seccomp_profile = optional(object({
            localhost_profile = optional(string)
            type = optional(string)
          }), null)
          supplemental_groups = optional(set(string))
          sysctl_blocks = optional(list(object({
            name  = string
            value = string
          })), null)
          windows_options_block = optional(object({
            gmsa_credential_spec = optional(string)
            gmsa_credential_spec_name = optional(string)
            host_process = optional(bool)
            run_as_username = optional(string)
          }), null)
        })), [])
        service_account_name = optional(string)
        share_process_namespace = optional(bool)
        subdomain = optional(string)
        termination_grace_period_seconds = optional(number)
        toleration_blocks = optional(list(object({
          effect = optional(string)
          key = optional(string)
          operator = optional(string)
          toleration_seconds = optional(string)
          value = optional(string)
        })), [])
        topology_spread_constraint_blocks = optional(list(object({
          label_selector_blocks = optional(list(object({
            match_expressions_blocks = optional(list(object({
              key = optional(string)
              operator = optional(string)
              values = optional(set(string))
            })), [])
            match_labels = optional(map(string))
          })), [])
          match_label_keys = optional(set(string))
          max_skew = optional(number)
          min_domains = optional(number)
          node_affinity_policy = optional(string)
          node_taints_policy = optional(string)
          topology_key = optional(string)
          when_unsatisfiable = optional(string)
        })), [])
        volume_blocks = optional(list(object({
          aws_elastic_block_store_block = optional(list(object({
            volume_id = string
            fs_type = optional(string)
            partition = optional(number)
            read_only = optional(bool)
          })), [])
          azure_disk_block = optional(object({
            caching_mode  = string
            data_disk_uri = string
            disk_name     = string
            fs_type = optional(string)
            kind = optional(string)
            read_only = optional(string)
          }), null)
          azure_file_block = optional(object({
            secret_name = string
            share_name  = string
            read_only = optional(bool)
            secret_namespace = optional(string)
          }), null)
          ceph_fs_block = optional(object({
            monitors = set(string)
            path = optional(string)
            read_only = optional(bool)
            secret_file = optional(string)
            secret_ref_block = optional(object({
              name = optional(string)
              namespace = optional(string)
            }), null)
            user = optional(string)
          }), null)
          cinder_block = optional(object({
            volume_id = string
            fs_type = optional(string)
            read_only = optional(bool)
          }), null)
          config_map_block = optional(object({
            default_mode = optional(string)
            items_blocks = optional(list(object({
              key = optional(string)
              mode = optional(string)
              path = optional(string)
            })), [])
            name = optional(string)
            optional = optional(bool)
          }), null)
          csi_block = optional(object({
            driver = string
            fs_type = optional(string)
            node_publish_secret_ref_block = optional(object({
              name = optional(string)
            }), null)
            read_only = optional(bool)
            volume_attributes = optional(map(string))
          }), null)
          downward_api_block = optional(object({
            default_mode = optional(string)
            items_blocks = optional(list(object({
              field_ref_object = object({
                api_version = optional(string)
                field_path = optional(string)
              })
              path = string
              mode = optional(string)
              resource_field_ref_block = optional(object({
                container_name = string
                resource       = string
                divisor = optional(string)
              }), null)
            })), [])
          }), null)
          empty_dir_block = optional(object({
            medium = optional(string)
            size_limit = optional(string)
          }), null)
          ephemeral_block = optional(object({
            volume_claim_template_block = object({
              spec_block = object({
                access_modes = set(string)
                resources_block = object({
                  limits = optional(map(string))
                  requests = optional(map(string))
                })
                selector_block = optional(object({
                  match_expressions_block = optional(object({
                    key = optional(string)
                    operator = optional(string)
                    values = optional(set(string))
                  }), null)
                  match_labels = optional(map(string))
                }), null)
                storage_class_name = optional(string)
                volume_mode = optional(string)
                volume_name = optional(string)
              })
              metadata_block = optional(object({
                annotations = optional(map(string))
                labels = optional(map(string))
              }), null)
            })
          }), null)
          fc_block = optional(object({
            lun = number
            target_ww_ns = set(string)
            fs_type = optional(string)
            read_only = optional(bool)
          }), null)
          flex_volume_block = optional(object({
            driver = string
            fs_type = optional(string)
            options = optional(map(string))
            read_only = optional(bool)
            secret_ref_block = optional(object({
              name = optional(string)
              namespace = optional(string)
            }), null)
          }), null)
          flocker_block = optional(object({
            dataset_name = optional(string)
            dataset_uuid = optional(string)
          }), null)
          gce_persistent_disk_block = optional(object({
            pd_name = string
            fs_type = optional(string)
            partition = optional(number)
            read_only = optional(bool)
          }), null)
          git_repo_block = optional(object({
            directory = optional(string)
            repository = optional(string)
            revision = optional(string)
          }), null)
          glusterfs_block = optional(object({
            endpoints_name = string
            path           = string
            read_only = optional(bool)
          }), null)
          host_path_block = optional(object({
            path = optional(string)
            type = optional(string)
          }), null)
          iscsi_block = optional(object({
            iqn           = string
            target_portal = string
            fs_type = optional(string)
            iscsi_interface = optional(string)
            lun = optional(number)
            read_only = optional(bool)
          }), null)
          local_block = optional(object({
            path = optional(string)
          }), null)
          name = optional(string)
          nfs_block = optional(object({
            path   = string
            server = string
            read_only = optional(string)
          }), null)
          persistent_volume_claim_block = optional(object({
            claim_name = optional(string)
            read_only = optional(bool)
          }), null)
          photon_persistent_disk_block = optional(object({
            pd_id = string
            fs_type = optional(string)
          }), null)
          projected_blocks = optional(list(object({
            sources_block = object({
              config_map_blocks = optional(list(object({
                items_blocks = optional(list(object({
                  key = optional(string)
                  mode = optional(string)
                  path = optional(string)
                })), [])
                name = optional(string)
                optional = optional(bool)
              })), [])
              downward_api_block = optional(object({
                items_blocks = optional(list(object({
                  path = string
                  field_ref_block = optional(object({
                    api_version = optional(string)
                    field_path = optional(string)
                  }), null)
                  mode = optional(string)
                  resource_field_ref_block = optional(object({
                    container_name = string
                    resource       = string
                    divisor = optional(string)
                  }), null)
                })), [])
              }), null)
              secret_blocks = optional(list(object({
                items_blocks = optional(list(object({
                  key = optional(string)
                  mode = optional(string)
                  path = optional(string)
                })), [])
                name = optional(string)
                optional = optional(bool)
              })), [])
              service_account_token_block = optional(object({
                path = string
                audience = optional(string)
                expiration_seconds = optional(number)
              }), null)
            })
            default_mode = optional(string)
          })), [])
          quobyte_block = optional(object({
            registry = string
            volume   = string
            group = optional(string)
            read_only = optional(bool)
            user = optional(string)
          }), null)
          rbd_block = optional(object({
            ceph_monitors = set(string)
            rbd_image = string
            fs_type = optional(string)
            keyring = optional(string)
            rados_user = optional(string)
            rbd_pool = optional(string)
            read_only = optional(bool)
            secret_ref_block = optional(object({
              name = optional(string)
              namespace = optional(string)
            }), null)
          }))
          secret_block = optional(object({
            default_mode = optional(string)
            items_blocks = optional(list(object({
              key = optional(string)
              mode = optional(string)
              path = optional(string)
            })), [])
            optional = optional(bool)
            secret_name = optional(string)
          }), null)
          vsphere_volume_block = optional(object({
            volume_path = string
            fs_type = optional(string)
          }), null)
        })), [])
      })
    })
    min_ready_seconds = optional(number)
    paused = optional(bool)
    progress_deadline_seconds = optional(number)
    replicas = optional(string)
    revision_history_limit = optional(number)
    selector_block = optional(object({
      match_expressions_blocks = optional(list(object({
        key = optional(string)
        operator = optional(string)
        values = optional(set(string))
      })), null)
      match_labels = optional(map(string))
    }), null)
    strategy_block = optional(object({
      rolling_update_block = optional(object({
        max_surge = optional(string)
        max_unavailable = optional(string)
      }), null)
      type = optional(string)
    }), null)
  })
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(string)
    delete = optional(string)
    update = optional(string)
  })
  default = null
}

variable "wait_for_rollout" {
  description = "Wait for the rollout of the deployment to complete."
  type        = bool
  default     = true
}