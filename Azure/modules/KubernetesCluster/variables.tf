variable "name" {
  description = "Specifies the name of the Key Vault."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "resource_group" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
}

variable "default_node_pool_blocks" {
  description = "A default_node_pool block as defined below."
  type        = list(object({
    name                          = string
    vm_size                       = string
    capacity_reservation_group_id = optional(string)
    custom_ca_trust_enabled       = optional(string)
    enable_auto_scaling           = optional(bool)
    enable_host_encryption        = optional(bool)
    enable_node_public_ip         = optional(bool)
    gpu_instance                  = optional(string)
    host_group_id                 = optional(string)
    kubelet_config_block          = optional(object({
      allowed_unsafe_sysctls    = optional(list(string))
      container_log_max_line    = optional(number)
      container_log_max_size_mb = optional(string)
      cpu_cfs_quota_enabled     = optional(string)
      cpu_cfs_quota_period      = optional(string)
      cpu_manager_policy        = optional(string)
      image_gc_high_threshold   = optional(number)
      image_gc_low_threshold    = optional(number)
      pod_max_pid               = optional(number)
      topology_manager_policy   = optional(string)
    }), null)
    linux_os_config_block = optional(object({
      swap_file_size_mb   = optional(string)
      sysctl_config_block = optional(object({
        fs_aio_max_nr                      = optional(number)
        fs_file_max                        = optional(number)
        fs_inotify_max_user_watches        = optional(number)
        fs_nr_open                         = optional(number)
        kernel_threads_max                 = optional(number)
        net_core_netdev_max_backlog        = optional(number)
        net_core_optmem_max                = optional(number)
        net_core_rmem_default              = optional(number)
        net_core_rmem_max                  = optional(number)
        net_core_somaxconn                 = optional(number)
        net_core_wmem_default              = optional(number)
        net_core_wmem_max                  = optional(number)
        net_ipv4_ip_local_port_range_max   = optional(number)
        net_ipv4_ip_local_port_range_min   = optional(number)
        net_ipv4_neigh_default_gc_thresh1  = optional(number)
        net_ipv4_neigh_default_gc_thresh2  = optional(number)
        net_ipv4_neigh_default_gc_thresh3  = optional(number)
        net_ipv4_tcp_fin_timeout           = optional(number)
        net_ipv4_tcp_keepalive_intvl       = optional(number)
        net_ipv4_tcp_keepalive_probes      = optional(number)
        net_ipv4_tcp_keepalive_time        = optional(number)
        net_ipv4_tcp_max_syn_backlog       = optional(number)
        net_ipv4_tcp_max_tw_buckets        = optional(number)
        net_ipv4_tcp_tw_reuse              = optional(string)
        net_netfilter_nf_conntrack_buckets = optional(number)
        net_netfilter_nf_conntrack_max     = optional(number)
        vm_max_map_count                   = optional(number)
        vm_swappiness                      = optional(number)
        vm_vfs_cache_pressure              = optional(number)
      }), null)
      transparent_huge_page_defrag  = optional(string)
      transparent_huge_page_enabled = optional(string)
    }), null)
    fips_enabled               = optional(bool)
    kubelet_disk_type          = optional(string)
    max_pods                   = optional(number)
    message_of_the_day         = optional(string)
    node_network_profile_block = optional(object({
      allowed_host_ports_blocks = optional(list(object({
        port_start = optional(number)
        port_end   = optional(number)
        protocol   = optional(string)
      })), [])
      application_security_group_ids = optional(list(string))
      node_public_ip_tags            = optional(list(map(any)))
    }), null)
    node_public_ip_prefix_id     = optional(string)
    node_labels                  = optional(map(string))
    only_critical_addons_enabled = optional(bool)
    orchestrator_version         = optional(string)
    os_disk_size_gb              = optional(string)
    os_disk_type                 = optional(string)
    os_sku                       = optional(string)
    pod_subnet_id                = optional(string)
    proximity_placement_group_id = optional(string)
    scale_down_mode              = optional(string)
    snapshot_id                  = optional(string)
    temporary_name_for_rotation  = optional(string)
    type                         = optional(string)
    tags                         = optional(map(string))
    ultra_ssd_enabled            = optional(bool)
    upgrade_settings_block       = optional(object({
      max_surge = number
    }), null)
    upgrade_settings = optional(string)
    workload_runtime = optional(string)
    zones            = optional(list(string))
    max_count        = optional(number)
    min_count        = optional(number)
    node_count       = optional(number)
  }))
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster."
  type        = string
  default     = null
}

variable "dns_prefix_private_cluster" {
  description = "Specifies the DNS prefix to use with private clusters."
  type        = string
  default     = null
}

variable "aci_connector_linux_block" {
  description = "An aci_connector_linux block supports the following."
  type        = object({
    subnet_name = string
  })
  default = null
}

variable "automatic_channel_upgrade" {
  description = "he upgrade channel for this Kubernetes Cluster."
  type        = string
  default     = null
}

variable "api_server_access_profile_block" {
  description = "An api_server_access_profile block supports the following."
  type        = object({
    authorized_ip_ranges     = optional(set(string))
    subnet_id                = optional(string)
    vnet_integration_enabled = optional(bool)
  })
  default = null
}

variable "auto_scaler_profile_block" {
  description = "An auto_scaler_profile block supports the following."
  type        = object({
    balance_similar_node_groups      = optional(bool)
    expander                         = optional(string)
    max_graceful_termination_sec     = optional(number)
    max_node_provisioning_time       = optional(string)
    max_unready_nodes                = optional(number)
    max_unready_percentage           = optional(number)
    new_pod_scale_up_delay           = optional(string)
    scale_down_delay_after_add       = optional(string)
    scale_down_delay_after_delete    = optional(string)
    scale_down_delay_after_failure   = optional(string)
    scan_interval                    = optional(string)
    scale_down_unneeded              = optional(string)
    scale_down_unready               = optional(string)
    scale_down_utilization_threshold = optional(string)
    empty_bulk_delete_max            = optional(number)
    skip_nodes_with_local_storage    = optional(bool)
    skip_nodes_with_system_pods      = optional(bool)
  })
  default = null
}