variable "name" {
  description = "The name of the Managed Kubernetes Cluster to create."
  type        = string
}

variable "role_arn" {
  description = "ARN of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf."
  type        = string
}

variable "vpc_config_block" {
  description = "Configuration block for the VPC associated with your cluster. Amazon EKS VPC resources have specific requirements to work properly with Kubernetes."
  type = object({
    endpoint_private_access = optional(bool)
    endpoint_public_access = optional(bool)
    public_access_cidrs = optional(list(string))
    security_group_ids = optional(list(string))
    subnet_ids = list(string)
  })
}

variable "access_config_block" {
  description = "Configuration block for the access config associated with your cluster, see Amazon EKS Access Entries."
  type = object({
    authentication_mode = optional(string)
    bootstrap_cluster_creator_admin_permissions = optional(bool)
  })
  default = null
}

variable "bootstrap_self_managed_addons" {
  description = "Install default unmanaged add-ons, such as aws-cni, kube-proxy, and CoreDNS during cluster creation."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.bootstrap_self_managed_addons)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = true
}

variable "compute_config_block" {
  description = "Configuration block with compute configuration for EKS Auto Mode."
  type = object({
    enabled = optional(bool)
    node_pools = optional(list(string))
    node_role_arn = optional(string)
  })
  default = null
}

variable "enabled_cluster_log_types" {
  description = "List of the desired control plane logging to enable."
  type = list(string)
  default = []
}

variable "encryption_config_block" {
  description = "Configuration block with encryption configuration for the cluster."
  type = object({
    provider_block = object({
      key_arn = string
    })
    resources = list(string)
  })
  default = null
}

variable "force_update_version" {
  description = "Force version update by overriding upgrade-blocking readiness checks when updating a cluster."
  type        = bool
  validation {
    condition = contains(["true", "false"], lower(tostring(var.force_update_version)))
    error_message = "Possible values can be \"true\" or \"false\" boolean."
  }
  default = false
}

variable "kubernetes_network_config_block" {
  description = "Configuration block with kubernetes network configuration for the cluster."
  type = object({
    elastic_load_balancing_block = optional(object({
      enabled = optional(bool)
    }), null)
    service_ipv4_cidr = optional(string)
    ip_family = optional(string)
  })
  default = null
}

variable "outpost_config_block" {
  description = "Configuration block representing the configuration of your local Amazon EKS cluster on an AWS Outpost."
  type = object({
    control_plane_instance_type = string
    control_plane_placement_block = optional(object({
      group_name = string
    }), null)
    outpost_arns = list(string)
  })
  default = null
}

variable "remote_network_config_block" {
  description = "Configuration block with remote network configuration for EKS Hybrid Nodes."
  type = object({
    remote_node_networks_blocks = optional(list(object({
      cidrs = list(string)
    })), [])
    remote_pod_networks_blocks = optional(list(object({
      cidrs = list(string)
    })), [])
  })
  default = null
}

variable "storage_config_block" {
  description = "Configuration block with storage configuration for EKS Auto Mode."
  type = object({
    block_storage_block = optional(object({
      enabled = optional(bool)
    }), null)
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type = map(any)
  default     = null
}

variable "upgrade_policy_block" {
  description = "Configuration block for the support policy to use for the cluster."
  type = object({
    support_type = optional(string)
  })
  default = null
}

variable "kubernetes_version" {
  description = "Desired Kubernetes master version."
  type        = string
  default     = null
}

variable "zonal_shift_config_block" {
  description = "Configuration block with zonal shift configuration for the cluster."
  type = object({
    enabled = optional(bool)
  })
  default = null
}

variable "timeouts_block" {
  description = "Some resource types provide a special timeouts nested block argument that allows you to customize how long certain operations are allowed to take before being considered to have failed."
  type = object({
    create = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}