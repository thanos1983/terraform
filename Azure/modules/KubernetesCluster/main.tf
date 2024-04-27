resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  dynamic "default_node_pool" {
    for_each = var.default_node_pool_blocks
    content {
      name                          = default_node_pool.value.name
      vm_size                       = default_node_pool.value.vm_size
      capacity_reservation_group_id = default_node_pool.value.capacity_reservation_group_id
      custom_ca_trust_enabled       = default_node_pool.value.custom_ca_trust_enabled
      enable_auto_scaling           = default_node_pool.value.enable_auto_scaling
      enable_host_encryption        = default_node_pool.value.enable_host_encryption
      enable_node_public_ip         = default_node_pool.value.enable_node_public_ip
      gpu_instance                  = default_node_pool.value.gpu_instance
      host_group_id                 = default_node_pool.value.host_group_id
      dynamic "kubelet_config" {
        for_each = default_node_pool.value.kubelet_config_block
        content {
          allowed_unsafe_sysctls    = kubelet_config.value.allowed_unsafe_sysctls
          container_log_max_line    = kubelet_config.value.container_log_max_line
          container_log_max_size_mb = kubelet_config.value.container_log_max_size_mb
          cpu_cfs_quota_enabled     = kubelet_config.value.cpu_cfs_quota_enabled
          cpu_cfs_quota_period      = kubelet_config.value.cpu_cfs_quota_period
          cpu_manager_policy        = kubelet_config.value.cpu_manager_policy
          image_gc_high_threshold   = kubelet_config.value.image_gc_high_threshold
          image_gc_low_threshold    = kubelet_config.value.image_gc_low_threshold
          pod_max_pid               = kubelet_config.value.pod_max_pid
          topology_manager_policy   = kubelet_config.value.topology_manager_policy
        }
      }
      dynamic "linux_os_config" {
        for_each = default_node_pool.value.linux_os_config_block
        content {
          swap_file_size_mb = linux_os_config.value.swap_file_size_mb
          dynamic "sysctl_config" {
            for_each = linux_os_config.value.sysctl_config_block
            content {
              fs_aio_max_nr                      = sysctl_config.value.fs_aio_max_nr
              fs_file_max                        = sysctl_config.value.fs_file_max
              fs_inotify_max_user_watches        = sysctl_config.value.fs_inotify_max_user_watches
              fs_nr_open                         = sysctl_config.value.fs_nr_open
              kernel_threads_max                 = sysctl_config.value.kernel_threads_max
              net_core_netdev_max_backlog        = sysctl_config.value.net_core_netdev_max_backlog
              net_core_optmem_max                = sysctl_config.value.net_core_optmem_max
              net_core_rmem_default              = sysctl_config.value.net_core_rmem_default
              net_core_rmem_max                  = sysctl_config.value.net_core_rmem_max
              net_core_somaxconn                 = sysctl_config.value.net_core_somaxconn
              net_core_wmem_default              = sysctl_config.value.net_core_wmem_default
              net_core_wmem_max                  = sysctl_config.value.net_core_wmem_max
              net_ipv4_ip_local_port_range_min   = sysctl_config.value.net_ipv4_ip_local_port_range_max
              net_ipv4_ip_local_port_range_max   = sysctl_config.value.net_ipv4_ip_local_port_range_min
              net_ipv4_neigh_default_gc_thresh1  = sysctl_config.value.net_ipv4_neigh_default_gc_thresh1
              net_ipv4_neigh_default_gc_thresh2  = sysctl_config.value.net_ipv4_neigh_default_gc_thresh2
              net_ipv4_neigh_default_gc_thresh3  = sysctl_config.value.net_ipv4_neigh_default_gc_thresh3
              net_ipv4_tcp_fin_timeout           = sysctl_config.value.net_ipv4_tcp_fin_timeout
              net_ipv4_tcp_keepalive_intvl       = sysctl_config.value.net_ipv4_tcp_keepalive_intvl
              net_ipv4_tcp_keepalive_probes      = sysctl_config.value.net_ipv4_tcp_keepalive_probes
              net_ipv4_tcp_keepalive_time        = sysctl_config.value.net_ipv4_tcp_keepalive_time
              net_ipv4_tcp_max_syn_backlog       = sysctl_config.value.net_ipv4_tcp_max_syn_backlog
              net_ipv4_tcp_max_tw_buckets        = sysctl_config.value.net_ipv4_tcp_max_tw_buckets
              net_ipv4_tcp_tw_reuse              = sysctl_config.value.net_ipv4_tcp_tw_reuse
              net_netfilter_nf_conntrack_buckets = sysctl_config.value.net_netfilter_nf_conntrack_buckets
              net_netfilter_nf_conntrack_max     = sysctl_config.value.net_netfilter_nf_conntrack_max
              vm_max_map_count                   = sysctl_config.value.vm_max_map_count
              vm_swappiness                      = sysctl_config.value.vm_swappiness
              vm_vfs_cache_pressure              = sysctl_config.value.vm_vfs_cache_pressure
            }
            transparent_huge_page_defrag  = linux_os_config.value.transparent_huge_page_defrag
            transparent_huge_page_enabled = linux_os_config.value.transparent_huge_page_enabled
          }
        }
      }
      fips_enabled       = default_node_pool.value.fips_enabled
      kubelet_disk_type  = default_node_pool.value.kubelet_disk_type
      max_pods           = default_node_pool.value.max_pods
      message_of_the_day = default_node_pool.value.message_of_the_day
      dynamic "node_network_profile" {
        for_each = default_node_pool.value.node_network_profile_block
        content {
          dynamic "allowed_host_ports" {
            for_each = node_network_profile.value.allowed_host_ports_blocks
            content {
              port_start = allowed_host_ports.value.port_start
              port_end   = allowed_host_ports.value.port_end
              protocol   = allowed_host_ports.value.protocol
            }
          }
          application_security_group_ids = node_network_profile.value.application_security_group_ids
          node_public_ip_tags            = node_network_profile.value.node_public_ip_tags
        }
      }
      node_public_ip_prefix_id     = default_node_pool.value.node_public_ip_prefix_id
      node_labels                  = default_node_pool.value.node_labels
      only_critical_addons_enabled = default_node_pool.value.only_critical_addons_enabled
      orchestrator_version         = default_node_pool.value.orchestrator_version
      os_disk_size_gb              = default_node_pool.value.os_disk_size_gb
      os_disk_type                 = default_node_pool.value.os_disk_type
      os_sku                       = default_node_pool.value.os_sku
      pod_subnet_id                = default_node_pool.value.pod_subnet_id
      proximity_placement_group_id = default_node_pool.value.proximity_placement_group_id
      scale_down_mode              = default_node_pool.value.scale_down_mode
      snapshot_id                  = default_node_pool.value.snapshot_id
      temporary_name_for_rotation  = default_node_pool.value.temporary_name_for_rotation
      type                         = default_node_pool.value.type
      tags                         = default_node_pool.value.tags
      ultra_ssd_enabled            = default_node_pool.value.ultra_ssd_enabled
      dynamic "upgrade_settings" {
        for_each = default_node_pool.value.upgrade_settings_block
        content {
          max_surge = upgrade_settings.value.max_surge
        }
      }
      upgrade_settings = default_node_pool.value.upgrade_settings
      workload_runtime = default_node_pool.value.workload_runtime
      zones            = default_node_pool.value.zones
      max_count        = default_node_pool.value.max_count
      min_count        = default_node_pool.value.min_count
      node_count       = default_node_pool.value.node_count
    }
  }

  dns_prefix                 = var.dns_prefix
  dns_prefix_private_cluster = var.dns_prefix_private_cluster

  dynamic "aci_connector_linux" {
    for_each = var.aci_connector_linux_block[*]
    content {
      subnet_name = aci_connector_linux.value.subnet_name
    }
  }

  automatic_channel_upgrade = var.automatic_channel_upgrade

  dynamic "api_server_access_profile" {
    for_each = var.api_server_access_profile_block[*]
    content {
      authorized_ip_ranges     = api_server_access_profile.value.authorized_ip_ranges
      subnet_id                = api_server_access_profile.value.subnet_id
      vnet_integration_enabled = api_server_access_profile.value.vnet_integration_enabled
    }
  }

  dynamic "auto_scaler_profile" {
    for_each = var.auto_scaler_profile_block[*]
    content {
      balance_similar_node_groups      = auto_scaler_profile.value.balance_similar_node_groups
      expander                         = auto_scaler_profile.value.expander
      max_graceful_termination_sec     = auto_scaler_profile.value.max_graceful_termination_sec
      max_node_provisioning_time       = auto_scaler_profile.value.max_node_provisioning_time
      max_unready_nodes                = auto_scaler_profile.value.max_unready_nodes
      max_unready_percentage           = auto_scaler_profile.value.max_unready_percentage
      new_pod_scale_up_delay           = auto_scaler_profile.value.new_pod_scale_up_delay
      scale_down_delay_after_add       = auto_scaler_profile.value.scale_down_delay_after_add
      scale_down_delay_after_delete    = auto_scaler_profile.value.scale_down_delay_after_delete
      scale_down_delay_after_failure   = auto_scaler_profile.value.scale_down_delay_after_failure
      scan_interval                    = auto_scaler_profile.value.scan_interval
      scale_down_unneeded              = auto_scaler_profile.value.scale_down_unneeded
      scale_down_unready               = auto_scaler_profile.value.scale_down_unready
      scale_down_utilization_threshold = auto_scaler_profile.value.scale_down_utilization_threshold
      empty_bulk_delete_max            = auto_scaler_profile.value.empty_bulk_delete_max
      skip_nodes_with_local_storage    = auto_scaler_profile.value.skip_nodes_with_local_storage
      skip_nodes_with_system_pods      = auto_scaler_profile.value.skip_nodes_with_system_pods
    }
  }

  dynamic "azure_active_directory_role_based_access_control" {
    for_each = var.azure_active_directory_role_based_access_control_block[*]
    content {
      managed                = azure_active_directory_role_based_access_control.value.managed
      tenant_id              = azure_active_directory_role_based_access_control.value.tenant_id
      admin_group_object_ids = azure_active_directory_role_based_access_control.value.admin_group_object_ids
      azure_rbac_enabled     = azure_active_directory_role_based_access_control.value.azure_rbac_enabled
    }
  }

  azure_policy_enabled = var.azure_policy_enabled

  dynamic "confidential_computing" {
    for_each = var.confidential_computing_block[*]
    content {
      sgx_quote_helper_enabled = confidential_computing.value.sgx_quote_helper_enabled
    }
  }

  custom_ca_trust_certificates_base64 = var.custom_ca_trust_certificates_base64
  disk_encryption_set_id              = var.disk_encryption_set_id
  edge_zone                           = var.edge_zone
  http_application_routing_enabled    = var.http_application_routing_enabled

  dynamic "http_proxy_config" {
    for_each = var.http_proxy_config_block[*]
    content {
      http_proxy  = http_proxy_config.value.http_proxy
      https_proxy = http_proxy_config.value.https_proxy
      no_proxy    = http_proxy_config.value.no_proxy
      trusted_ca  = http_proxy_config.value.trusted_ca
    }
  }

  dynamic "identity" {
    for_each = var.identity_block
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  image_cleaner_enabled        = var.image_cleaner_enabled
  image_cleaner_interval_hours = var.image_cleaner_interval_hours

  dynamic "ingress_application_gateway" {
    for_each = var.ingress_application_gateway_block[*]
    content {
      gateway_id   = ingress_application_gateway.value.gateway_id
      gateway_name = ingress_application_gateway.value.gateway_name
      subnet_cidr  = ingress_application_gateway.value.subnet_cidr
      subnet_id    = ingress_application_gateway.value.subnet_id
    }
  }

  dynamic "key_management_service" {
    for_each = var.key_management_service_block[*]
    content {
      key_vault_key_id         = key_management_service.value.key_vault_key_id
      key_vault_network_access = key_management_service.value.key_vault_network_access
    }
  }

  dynamic "key_vault_secrets_provider" {
    for_each = var.key_vault_secrets_provider_block[*]
    content {
      secret_rotation_enabled  = key_vault_secrets_provider.value.secret_rotation_enabled
      secret_rotation_interval = key_vault_secrets_provider.value.secret_rotation_interval
    }
  }

  dynamic "kubelet_identity" {
    for_each = var.kubelet_identity_block[*]
    content {
      client_id                 = kubelet_identity.value.client_id
      object_id                 = kubelet_identity.value.object_id
      user_assigned_identity_id = kubelet_identity.value.user_assigned_identity_id
    }
  }

  kubernetes_version = var.kubernetes_version

  dynamic "linux_profile" {
    for_each = var.linux_profile_block[*]
    content {
      admin_username = linux_profile.value.admin_username
      dynamic "ssh_key" {
        for_each = linux_profile.value.ssh_key[*]
        content {
          key_data = ssh_key.value.key_data
        }
      }
    }
  }

  local_account_disabled = var.local_account_disabled

  dynamic "maintenance_window" {
    for_each = var.maintenance_window_block[*]
    content {
      dynamic "allowed" {
        for_each = maintenance_window.value.allowed_block
        content {
          day   = allowed.value.day
          hours = allowed.value.hours
        }
      }
      dynamic "not_allowed" {
        for_each = maintenance_window.value.not_allowed_block
        content {
          end   = not_allowed.value.end
          start = not_allowed.value.start
        }
      }
    }
  }

  dynamic "maintenance_window_auto_upgrade" {
    for_each = var.maintenance_window_auto_upgrade_block[*]
    content {
      frequency    = maintenance_window_auto_upgrade.value.frequency
      interval     = maintenance_window_auto_upgrade.value.interval
      duration     = maintenance_window_auto_upgrade.value.duration
      day_of_week  = maintenance_window_auto_upgrade.value.day_of_week
      day_of_month = maintenance_window_auto_upgrade.value.day_of_month
      week_index   = maintenance_window_auto_upgrade.value.week_index
      start_time   = maintenance_window_auto_upgrade.value.start_time
      utc_offset   = maintenance_window_auto_upgrade.value.utc_offset
      start_date   = maintenance_window_auto_upgrade.value.start_date
      dynamic "not_allowed" {
        for_each = maintenance_window_auto_upgrade.value.not_allowed_block
        content {
          end   = not_allowed.value.end
          start = not_allowed.value.start
        }
      }
    }
  }

  dynamic "maintenance_window_node_os" {
    for_each = var.maintenance_window_node_os_block[*]
    content {
      frequency    = maintenance_window_node_os.value.frequency
      interval     = maintenance_window_node_os.value.interval
      duration     = maintenance_window_node_os.value.duration
      day_of_week  = maintenance_window_node_os.value.day_of_week
      day_of_month = maintenance_window_node_os.value.day_of_month
      week_index   = maintenance_window_node_os.value.week_index
      start_time   = maintenance_window_node_os.value.start_time
      utc_offset   = maintenance_window_node_os.value.utc_offset
      start_date   = maintenance_window_node_os.value.start_date
      dynamic "not_allowed" {
        for_each = maintenance_window_node_os.value.not_allowed_block
        content {
          end   = not_allowed.value.end
          start = not_allowed.value.start
        }
      }
    }
  }

  tags = var.tags
}