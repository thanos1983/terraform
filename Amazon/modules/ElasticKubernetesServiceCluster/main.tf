resource "aws_eks_cluster" "eks_cluster" {
  name     = var.name
  role_arn = var.role_arn

  dynamic "vpc_config" {
    for_each = var.vpc_config_block[*]
    content {
      endpoint_private_access = vpc_config.value.endpoint_private_access
      endpoint_public_access  = vpc_config.value.endpoint_public_access
      public_access_cidrs     = vpc_config.value.public_access_cidrs
      security_group_ids      = vpc_config.value.security_group_ids
      subnet_ids              = vpc_config.value.subnet_ids
    }
  }

  dynamic "access_config" {
    for_each = var.access_config_block[*]
    content {
      authentication_mode                         = access_config.value.authentication_mode
      bootstrap_cluster_creator_admin_permissions = access_config.value.bootstrap_cluster_creator_admin_permissions
    }
  }

  bootstrap_self_managed_addons = var.bootstrap_self_managed_addons

  dynamic "compute_config" {
    for_each = var.compute_config_block[*]
    content {
      enabled       = compute_config.value.enabled
      node_pools    = compute_config.value.node_pools
      node_role_arn = compute_config.value.node_role_arn
    }
  }

  enabled_cluster_log_types = var.enabled_cluster_log_types

  dynamic "encryption_config" {
    for_each = var.encryption_config_block[*]
    content {
      dynamic "provider" {
        for_each = encryption_config.value.provider_block[*]
        content {
          key_arn = provider.value.key_arn
        }
      }
      resources = encryption_config.value.resources
    }
  }

  force_update_version = var.force_update_version

  dynamic "kubernetes_network_config" {
    for_each = var.kubernetes_network_config_block[*]
    content {
      dynamic "elastic_load_balancing" {
        for_each = kubernetes_network_config.value.elastic_load_balancing_block[*]
        content {
          enabled = elastic_load_balancing.value.enabled
        }
      }
      service_ipv4_cidr = kubernetes_network_config.value.service_ipv4_cidr
      ip_family         = kubernetes_network_config.value.ip_family
    }
  }

  dynamic "outpost_config" {
    for_each = var.outpost_config_block[*]
    content {
      control_plane_instance_type = outpost_config.value.control_plane_instance_type

      dynamic "control_plane_placement" {
        for_each = outpost_config.value.control_plane_placement_block[*]
        content {
          group_name = control_plane_placement.value.group_name
        }
      }

      outpost_arns = outpost_config.value.outpost_arns
    }
  }

  dynamic "remote_network_config" {
    for_each = var.remote_network_config_block[*]
    content {
      dynamic "remote_node_networks" {
        for_each = remote_network_config.value.remote_node_networks_blocks
        content {
          cidrs = remote_node_networks.value.cidrs
        }
      }

      dynamic "remote_pod_networks" {
        for_each = remote_network_config.value.remote_pod_networks_blocks
        content {
          cidrs = remote_pod_networks.value.cidrs
        }
      }
    }
  }

  dynamic "storage_config" {
    for_each = var.storage_config_block[*]
    content {
      dynamic "block_storage" {
        for_each = storage_config.value.block_storage_block[*]
        content {
          enabled = block_storage.value.enabled
        }
      }
    }
  }

  tags = var.tags

  dynamic "upgrade_policy" {
    for_each = var.upgrade_policy_block[*]
    content {
      support_type = upgrade_policy.value.support_type
    }
  }

  version = var.kubernetes_version

  dynamic "zonal_shift_config" {
    for_each = var.zonal_shift_config_block[*]
    content {
      enabled = zonal_shift_config.value.enabled
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}
