variable "metadata_block" {
  description = "Standard secret's metadata."
  type = object({
    annotations = optional(map(string))
    labels = optional(map(string))
    name = optional(string)
  })
}

variable "spec_block" {
  description = "Spec of the persistent volume owned by the cluster."
  type = object({
    access_modes = set(string)
    capacity = map(string)
    persistent_volume_source_block = object({
      aws_elastic_block_store_block = optional(object({
        volume_id = string
        fs_type = optional(string)
        partition = optional(number)
        read_only = optional(bool)
      }), null)
      azure_disk_block = optional(object({
        caching_mode  = string
        data_disk_uri = string
        disk_name     = string
        fs_type = optional(string)
        kind = optional(string)
        read_only = optional(bool)
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
      csi_block = optional(object({
        driver        = string
        volume_handle = string
        controller_expand_secret_ref_block = optional(object({
          name = optional(string)
          namespace = optional(string)
        }), null)
        controller_publish_secret_ref_block = optional(object({
          name = optional(string)
          namespace = optional(string)
        }), null)
        fs_type = optional(string)
        node_publish_secret_ref_block = optional(object({
          name = optional(string)
          namespace = optional(string)
        }), null)
        node_stage_secret_ref_block = optional(object({
          name = optional(string)
          namespace = optional(string)
        }), null)
        read_only = optional(bool)
        volume_attributes = optional(map(string))
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
      nfs_block = optional(object({
        path   = string
        server = string
        read_only = optional(bool)
      }), null)
      photon_persistent_disk_block = optional(object({
        pd_id = string
        fs_type = optional(string)
      }), null)
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
      }), null)
      vsphere_volume_block = optional(object({
        volume_path = string
        fs_type = optional(string)
      }), null)
    })
    claim_ref_block = optional(object({
      name = string
      namespace = optional(string)
    }), null)
    mount_options = optional(set(string), null)
    node_affinity_block = optional(object({
      required_block = optional(object({
        node_selector_term_block = optional(object({
          match_expressions_blocks = optional(list(object({
            key      = string
            operator = string
            values = optional(set(string))
          })), [])
          match_fields_blocks = optional(list(object({
            key      = string
            operator = string
            values = optional(set(string))
          })), [])
        }), null)
      }), null)
    }), null)
    persistent_volume_reclaim_policy = optional(string)
    storage_class_name = optional(string)
    volume_mode = optional(string)
  })
}

variable "timeouts_block" {
  description = "The timeouts block allows you to specify timeouts for certain actions"
  type = object({
    create = optional(string)
  })
  default = null
}