variable "name" {
  description = "Specifies the name of the Key Vault."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "resource_group_name" {
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
      drain_timeout_in_minutes      = optional(number)
      node_soak_duration_in_minutes = optional(number, 0)
      max_surge                     = string
    }), null)
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

variable "azure_active_directory_role_based_access_control_block" {
  description = "An azure_active_directory_role_based_access_control block supports the following"
  type        = object({
    managed                = optional(bool, false)
    tenant_id              = optional(string)
    admin_group_object_ids = optional(list(string))
    azure_rbac_enabled     = optional(bool)
  })
  default = null
}

variable "azure_policy_enabled" {
  description = "Should the Azure Policy Add-On be enabled?"
  type        = bool
  default     = false
}

variable "confidential_computing_block" {
  description = "A confidential_computing block supports the following."
  type        = object({
    sgx_quote_helper_enabled = bool
  })
  default = null
}

variable "custom_ca_trust_certificates_base64" {
  description = "A list of up to 10 base64 encoded CAs that will be added to the trust store on nodes with the custom_ca_trust_enabled feature enabled."
  type        = list(string)
  default     = []
}

variable "disk_encryption_set_id" {
  description = "The ID of the Disk Encryption Set which should be used for the Nodes and Volumes."
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Managed Kubernetes Cluster should exist."
  type        = string
  default     = null
}

variable "http_application_routing_enabled" {
  description = "Should HTTP Application Routing be enabled?"
  type        = bool
  default     = false
}

variable "http_proxy_config_block" {
  description = "A http_proxy_config block supports the following."
  type        = object({
    http_proxy  = optional(string)
    https_proxy = optional(string)
    no_proxy    = optional(list(string))
    trusted_ca  = optional(string)
  })
  default = null
}

variable "identity_block" {
  description = "An identity block supports the following."
  type        = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = {
    type = "SystemAssigned"
  }
}

variable "image_cleaner_enabled" {
  description = "Specifies whether Image Cleaner is enabled."
  type        = bool
  default     = false
}

variable "image_cleaner_interval_hours" {
  description = "Specifies the interval in hours when images should be cleaned up."
  type        = number
  default     = 48
}

variable "ingress_application_gateway_block" {
  description = "A ingress_application_gateway block as defined below."
  type        = object({
    gateway_id   = optional(string)
    gateway_name = optional(string)
    subnet_cidr  = optional(string)
    subnet_id    = optional(string)
  })
  default = null
}

variable "key_management_service_block" {
  description = "A key_management_service block as defined below."
  type        = object({
    key_vault_key_id         = string
    key_vault_network_access = optional(string)
  })
  default = null
}

variable "key_vault_secrets_provider_block" {
  description = "A key_vault_secrets_provider block as defined below."
  type        = object({
    secret_rotation_enabled  = optional(bool)
    secret_rotation_interval = optional(string)
  })
  default = null
}

variable "kubelet_identity_block" {
  description = "A kubelet_identity block as defined below."
  type        = object({
    client_id                 = optional(string)
    object_id                 = optional(string)
    user_assigned_identity_id = optional(string)
  })
  default = null
}

variable "kubernetes_version" {
  description = "Version of Kubernetes specified when creating the AKS managed cluster."
  type        = string
  default     = null
}

variable "linux_profile_block" {
  description = "A linux_profile block as defined below."
  type        = object({
    admin_username = string
    ssh_key        = object({
      key_data = string
    })
  })
  default = null
}

variable "local_account_disabled" {
  description = "If true local accounts will be disabled."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.local_account_disabled)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "maintenance_window_block" {
  description = "A maintenance_window block supports the following."
  type        = object({
    allowed_block = optional(list(object({
      day   = string
      hours = list(string)
    })), [])
    not_allowed_block = optional(list(object({
      end   = string
      start = string
    })), [])
  })
  default = null
}

variable "maintenance_window_auto_upgrade_block" {
  description = "A maintenance_window_auto_upgrade block as defined below."
  type        = object({
    frequency         = string
    interval          = number
    duration          = number
    day_of_week       = optional(string)
    day_of_month      = optional(string)
    week_index        = optional(string)
    start_time        = optional(string)
    utc_offset        = optional(string)
    start_date        = optional(string)
    not_allowed_block = optional(list(object({
      end   = string
      start = string
    })), [])
  })
  default = null
}

variable "maintenance_window_node_os_block" {
  description = "A maintenance_window_node_os block as defined below."
  type        = object({
    frequency         = string
    interval          = number
    duration          = number
    day_of_week       = optional(string)
    day_of_month      = optional(string)
    week_index        = optional(string)
    start_time        = optional(string)
    utc_offset        = optional(string)
    start_date        = optional(string)
    not_allowed_block = optional(list(object({
      end   = string
      start = string
    })), [])
  })
  default = null
}

variable "microsoft_defender_block" {
  description = "A microsoft_defender block as defined below."
  type        = object({
    log_analytics_workspace_id = string
  })
  default = null
}

variable "monitor_metrics_block" {
  description = "Specifies a Prometheus add-on profile for the Kubernetes Cluster."
  type        = object({
    annotations_allowed = optional(list(string))
    labels_allowed      = optional(list(string))
  })
  default = null
}

variable "network_profile_block" {
  description = "A network_profile block as defined below."
  type        = object({
    network_plugin              = string
    network_mode                = optional(string)
    network_policy              = optional(string)
    dns_service_ip              = optional(string)
    ebpf_data_plane             = optional(string)
    network_plugin_mode         = optional(string)
    outbound_type               = optional(string)
    pod_cidr                    = optional(string)
    pod_cidrs                   = optional(list(string))
    service_cidr                = optional(string)
    service_cidrs               = optional(list(string))
    ip_versions                 = optional(list(string))
    load_balancer_sku           = optional(string)
    load_balancer_profile_block = optional(object({
      idle_timeout_in_minutes     = optional(number)
      managed_outbound_ip_count   = optional(number)
      managed_outbound_ipv6_count = optional(number)
      outbound_ip_address_ids     = optional(list(string))
      outbound_ip_prefix_ids      = optional(list(string))
      outbound_ports_allocated    = optional(number)
    }), null)
    nat_gateway_profile_block = optional(object({
      idle_timeout_in_minutes   = optional(number)
      managed_outbound_ip_count = optional(number)
    }), null)
  })
  default = null
}

variable "node_os_channel_upgrade" {
  description = "The upgrade channel for this Kubernetes Cluster Nodes' OS Image."
  type        = string
  validation {
    condition     = contains(["Unmanaged", "SecurityPatch", "NodeImage", "None"], title(var.node_os_channel_upgrade))
    error_message = "Parameter must be either \"Unmanaged\", \"SecurityPatch\", \"NodeImage\" or \"None\" string variable."
  }
  default = "None"
}

variable "node_resource_group" {
  description = "The name of the Resource Group where the Kubernetes Nodes should exist."
  type        = string
  default     = null
}

variable "oidc_issuer_enabled" {
  description = "Enable or Disable the OIDC issuer URL."
  type        = string
  default     = null
}

variable "oms_agent_block" {
  description = "A oms_agent block as defined below."
  type        = object({
    log_analytics_workspace_id      = string
    msi_auth_for_monitoring_enabled = optional(bool)
  })
  default = null
}

variable "open_service_mesh_enabled" {
  description = "Is Open Service Mesh enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.open_service_mesh_enabled)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "private_cluster_enabled" {
  description = "Should this Kubernetes Cluster have its API server only exposed on internal IP addresses?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.private_cluster_enabled)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "private_dns_zone_id" {
  description = "Either the ID of Private DNS Zone which should be delegated to this Cluster, System to have AKS manage this or None."
  type        = string
  default     = null
}

variable "private_cluster_public_fqdn_enabled" {
  description = "Specifies whether a Public FQDN for this Private Cluster should be added."
  type        = bool
  default     = false
}

variable "service_mesh_profile_block" {
  description = "A service_mesh_profile block as defined below."
  type        = object({
    mode                             = string
    internal_ingress_gateway_enabled = optional(bool)
    external_ingress_gateway_enabled = optional(bool)
  })
  default = null
}

variable "workload_autoscaler_profile_block" {
  description = "A workload_autoscaler_profile block defined below."
  type        = object({
    keda_enabled                    = optional(bool)
    vertical_pod_autoscaler_enabled = optional(bool)
  })
  default = null
}

variable "workload_identity_enabled" {
  description = "Specifies whether Azure AD Workload Identity should be enabled for the Cluster."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.workload_identity_enabled)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "role_based_access_control_enabled" {
  description = "Whether Role Based Access Control for the Kubernetes Cluster should be enabled."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.role_based_access_control_enabled)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "run_command_enabled" {
  description = "Whether to enable run command for the cluster or not."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.run_command_enabled)))
    error_message = "Parameter must be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "service_principal_block" {
  description = "A service_principal block as documented below."
  type        = object({
    client_id     = string
    client_secret = string
  })
  default = null
}

variable "sku_tier" {
  description = "The SKU Tier that should be used for this Kubernetes Cluster."
  type        = string
  validation {
    condition     = contains(["Premium", "Standard", "Free"], title(var.sku_tier))
    error_message = "Parameter must be \"Premium\", \"Standard\" or \"Free\" string variable."
  }
  default = "Free"
}

variable "storage_profile_block" {
  description = "A storage_profile block as defined below."
  type        = object({
    blob_driver_enabled         = optional(bool)
    disk_driver_enabled         = optional(bool)
    disk_driver_version         = optional(string)
    file_driver_enabled         = optional(bool)
    snapshot_controller_enabled = optional(bool)
  })
  default = null
}

variable "support_plan" {
  description = "Specifies the support plan which should be used for this Kubernetes Cluster."
  type        = string
  validation {
    condition     = contains(["KubernetesOfficial", "AKSLongTermSupport"], title(var.support_plan))
    error_message = "Parameter must be \"KubernetesOfficial\" or \"AKSLongTermSupport\" string variable."
  }
  default = "KubernetesOfficial"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}

variable "web_app_routing_block" {
  description = "A web_app_routing block as defined below."
  type        = object({
    dns_zone_id = string
  })
  default = null
}

variable "windows_profile_block" {
  description = "A windows_profile block as defined below."
  type        = object({
    admin_username = string
    admin_password = optional(string)
    license        = optional(string)
    gmsa_block     = optional(object({
      dns_server  = string
      root_domain = string
    }), null)
  })
  default = null
}