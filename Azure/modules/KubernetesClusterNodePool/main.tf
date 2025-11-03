resource "azurerm_kubernetes_cluster_node_pool" "kubernetes_cluster_node_pool" {
  name                          = var.name
  kubernetes_cluster_id         = var.kubernetes_cluster_id
  vm_size                       = var.vm_size
  capacity_reservation_group_id = var.capacity_reservation_group_id
  auto_scaling_enabled          = var.auto_scaling_enabled
  host_encryption_enabled       = var.host_encryption_enabled
  node_public_ip_enabled        = var.node_public_ip_enabled
  eviction_policy               = var.eviction_policy
  host_group_id                 = var.host_group_id

  dynamic "kubelet_config" {
    for_each = var.kubelet_config_block[*]
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
    for_each = var.linux_os_config_block[*]
    content {
      swap_file_size_mb = linux_os_config.value.swap_file_size_mb
      dynamic "sysctl_config" {
        for_each = linux_os_config.value.sysctl_config_block[*]
        content {
          fs_aio_max_nr                      = sysctl_config.value.fs_aio_max_nr
          fs_file_max                        = sysctl_config.value.fs_file_max
          fs_inotify_max_user_watches        = sysctl_config.value.fs_inotify_max_user_watches
          fs_nr_open                         = sysctl_config.value.fs_nr_open
          kernel_threads_max                 = sysctl_config.value.kernel_threads_max
          net_core_netdev_max_backlog        = sysctl_config.value.net_core_netdev_max_backlog
          net_core_optmem_max                = sysctl_config.value.net_core_rmem_default
          net_core_rmem_default              = sysctl_config.value.net_core_rmem_default
          net_core_rmem_max                  = sysctl_config.value.net_core_rmem_max
          net_core_somaxconn                 = sysctl_config.value.net_core_somaxconn
          net_core_wmem_default              = sysctl_config.value.net_core_wmem_default
          net_core_wmem_max                  = sysctl_config.value.net_core_rmem_max
          net_ipv4_ip_local_port_range_max   = sysctl_config.value.net_ipv4_ip_local_port_range_max
          net_ipv4_ip_local_port_range_min   = sysctl_config.value.net_ipv4_ip_local_port_range_min
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
        }
      }
      transparent_huge_page_defrag  = linux_os_config.value.transparent_huge_page_defrag
      transparent_huge_page_enabled = linux_os_config.value.transparent_huge_page_enabled
    }
  }

  fips_enabled       = var.fips_enabled
  gpu_instance       = var.gpu_instance
  kubelet_disk_type  = var.kubelet_disk_type
  max_pods           = var.max_pods
  mode               = var.mode

  dynamic "node_network_profile" {
    for_each = var.node_network_profile_block[*]
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

  node_labels                  = var.node_labels
  node_public_ip_prefix_id     = var.node_public_ip_prefix_id
  node_taints                  = var.node_taints
  orchestrator_version         = var.orchestrator_version
  os_disk_size_gb              = var.os_disk_size_gb
  os_disk_type                 = var.os_disk_type
  pod_subnet_id                = var.pod_subnet_id
  os_sku                       = var.os_sku
  os_type                      = var.os_type
  priority                     = var.priority
  proximity_placement_group_id = var.proximity_placement_group_id
  spot_max_price               = var.spot_max_price
  snapshot_id                  = var.snapshot_id
  tags                         = var.tags
  scale_down_mode              = var.scale_down_mode
  ultra_ssd_enabled            = var.ultra_ssd_enabled

  dynamic "upgrade_settings" {
    for_each = var.upgrade_settings_block[*]
    content {
      drain_timeout_in_minutes      = upgrade_settings.value.drain_timeout_in_minutes
      node_soak_duration_in_minutes = upgrade_settings.value.node_soak_duration_in_minutes
      max_surge                     = upgrade_settings.value.max_surge
    }
  }

  vnet_subnet_id = var.vnet_subnet_id

  dynamic "windows_profile" {
    for_each = var.windows_profile_block[*]
    content {
      outbound_nat_enabled = windows_profile.value.outbound_nat_enabled
    }
  }

  workload_runtime = var.workload_runtime
  zones            = var.zones
  max_count        = var.max_count
  min_count        = var.min_count
  node_count       = var.node_count

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}
