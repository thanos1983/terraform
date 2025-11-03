variable "name" {
  description = "The name of the Node Pool which should be created within the Kubernetes Cluster."
  type        = string
}

variable "kubernetes_cluster_id" {
  description = "The ID of the Kubernetes Cluster where this Node Pool should exist."
  type        = string
}

variable "vm_size" {
  description = "The SKU which should be used for the Virtual Machines used in this Node Pool."
  type        = string
}

variable "capacity_reservation_group_id" {
  description = "Specifies the ID of the Capacity Reservation Group where this Node Pool should exist."
  type        = string
  default     = null
}

variable "auto_scaling_enabled" {
  description = "Whether to enable auto-scaler."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.auto_scaling_enabled)))
    error_message = "Parameter must be \"true\" or \"false\"."
  }
  default = false
}

variable "host_encryption_enabled" {
  description = "Should the nodes in this Node Pool have host encryption enabled?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.host_encryption_enabled)))
    error_message = "Parameter must be \"true\" or \"false\"."
  }
  default = false
}

variable "node_public_ip_enabled" {
  description = "Should each node have a Public IP Address?"
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.node_public_ip_enabled)))
    error_message = "Parameter must be \"true\" or \"false\"."
  }
  default = false
}

variable "eviction_policy" {
  description = "The Eviction Policy which should be used for Virtual Machines within the Virtual Machine Scale Set powering this Node Pool."
  type        = string
  validation {
    condition     = contains(["Deallocate", "Delete"], title(var.eviction_policy))
    error_message = "Parameter must be \"Deallocate\" or \"Delete\"."
  }
  default = "Delete"
}

variable "host_group_id" {
  description = "The fully qualified resource ID of the Dedicated Host Group to provision virtual machines from."
  type        = string
  default     = null
}

variable "kubelet_config_block" {
  description = "A kubelet_config block as defined below."
  type = object({
    allowed_unsafe_sysctls    = optional(list(string))
    container_log_max_line    = optional(number)
    container_log_max_size_mb = optional(string)
    cpu_cfs_quota_enabled     = optional(string)
    cpu_cfs_quota_period      = optional(string)
    cpu_manager_policy        = optional(string)
    image_gc_high_threshold   = optional(string)
    image_gc_low_threshold    = optional(string)
    pod_max_pid               = optional(string)
    topology_manager_policy   = optional(string)
  })
  default = null
}

variable "linux_os_config_block" {
  description = "A linux_os_config block as defined below."
  type = object({
    swap_file_size_mb = optional(string)
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
    }), null)
    transparent_huge_page_defrag  = optional(string)
    transparent_huge_page_enabled = optional(string)
  })
  default = null
}

variable "fips_enabled" {
  description = "Should the nodes in this Node Pool have Federal Information Processing Standard enabled?"
  type        = bool
  default     = false
}

variable "gpu_instance" {
  description = "Specifies the GPU MIG instance profile for supported GPU VM SKU."
  type        = string
  default     = null
}

variable "kubelet_disk_type" {
  description = "The type of disk used by kubelet."
  type        = string
  default     = null
}

variable "max_pods" {
  description = "The maximum number of pods that can run on each agent."
  type        = number
  default     = null
}

variable "mode" {
  description = "Should this Node Pool be used for System or User resources?"
  type        = string
  validation {
    condition     = contains(["System", "User"], title(var.mode))
    error_message = "Parameter must be \"System\" or \"User\"."
  }
  default = "User"
}

variable "node_network_profile_block" {
  description = "A node_network_profile block as documented below."
  type = object({
    allowed_host_ports_blocks = optional(list(object({
      port_start = optional(string)
      port_end   = optional(string)
      protocol   = optional(string)
    })))
    application_security_group_ids = optional(list(string))
    node_public_ip_tags            = optional(map(string))
  })
  default = null
}

variable "node_labels" {
  description = "A map of Kubernetes labels which should be applied to nodes in this Node Pool."
  type        = map(string)
  default     = null
}

variable "node_public_ip_prefix_id" {
  description = "Resource ID for the Public IP Addresses Prefix for the nodes in this Node Pool."
  type        = string
  default     = null
}

variable "node_taints" {
  description = "A list of Kubernetes taints which should be applied to nodes in the agent pool (e.g key=value:NoSchedule)."
  type        = list(string)
  default     = null
}

variable "orchestrator_version" {
  description = "Version of Kubernetes used for the Agents."
  type        = string
  default     = null
}

variable "os_disk_size_gb" {
  description = "The Agent Operating System disk size in GB."
  type        = number
  default     = null
}

variable "os_disk_type" {
  description = "The type of disk which should be used for the Operating System."
  type        = string
  default     = null
}

variable "pod_subnet_id" {
  description = "The ID of the Subnet where the pods in the Node Pool should exist."
  type        = string
  default     = null
}

variable "os_sku" {
  description = "Specifies the OS SKU used by the agent pool."
  type        = string
  validation {
    condition     = contains(["AzureLinux", "Ubuntu", "Windows2019", "Windows2022"], title(var.os_sku))
    error_message = "Parameter must be \"AzureLinux\", \"Ubuntu\", \"Windows2019\" or \"Windows2022\"."
  }
  default = "Ubuntu"
}

variable "os_type" {
  description = "The Operating System which should be used for this Node Pool."
  type        = string
  validation {
    condition     = contains(["Windows", "Linux"], title(var.os_type))
    error_message = "Parameter must be \"Windows\" or \"Linux\"."
  }
  default = "Linux"
}

variable "priority" {
  description = "The Priority for Virtual Machines within the Virtual Machine Scale Set that powers this Node Pool."
  type        = string
  validation {
    condition     = contains(["Regular", "Spot"], title(var.priority))
    error_message = "Parameter must be \"Regular\" or \"Spot\"."
  }
  default = "Regular"
}

variable "proximity_placement_group_id" {
  description = "The ID of the Proximity Placement Group where the Virtual Machine Scale Set that powers this Node Pool will be placed."
  type        = string
  default     = null
}

variable "spot_max_price" {
  description = "The maximum price you're willing to pay in USD per Virtual Machine."
  type        = number
  default     = null
}

variable "snapshot_id" {
  description = "The ID of the Snapshot which should be used to create this Node Pool."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "scale_down_mode" {
  description = "Specifies how the node pool should deal with scaled-down nodes."
  type        = string
  validation {
    condition     = contains(["Delete", "Deallocate"], title(var.scale_down_mode))
    error_message = "Parameter must be \"Delete\" or \"Deallocate\"."
  }
  default = "Delete"
}

variable "ultra_ssd_enabled" {
  description = "Specifies how the node pool should deal with scaled-down nodes."
  type        = bool
  validation {
    condition     = contains(["true", "false"], lower(tostring(var.ultra_ssd_enabled)))
    error_message = "Parameter must be \"true\" or \"false\"."
  }
  default = false
}

variable "upgrade_settings_block" {
  description = "A upgrade_settings block as documented below."
  type = object({
    drain_timeout_in_minutes      = optional(number)
    node_soak_duration_in_minutes = optional(number)
    max_surge                     = number
  })
  default = null
}

variable "vnet_subnet_id" {
  description = "The ID of the Subnet where this Node Pool should exist."
  type        = string
  default     = null
}

variable "windows_profile_block" {
  description = "A windows_profile block as documented below."
  type = object({
    outbound_nat_enabled = optional(bool)
  })
  default = null
}

variable "workload_runtime" {
  description = "A windows_profile block as documented below."
  type        = string
  default     = null
}

variable "zones" {
  description = "Specifies a list of Availability Zones in which this Kubernetes Cluster Node Pool should be located."
  type        = list(string)
  default     = null
}

variable "max_count" {
  description = "The maximum number of nodes which should exist within this Node Pool."
  type        = number
  default     = null
}

variable "min_count" {
  description = "The minimum number of nodes which should exist within this Node Pool."
  type        = number
  default     = null
}

variable "node_count" {
  description = "The initial number of nodes which should exist within this Node Pool."
  type        = number
  default     = null
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(number, 60)
    update = optional(number, 60)
    read   = optional(number, 5)
    delete = optional(number, 60)
  })
  default = null
}
