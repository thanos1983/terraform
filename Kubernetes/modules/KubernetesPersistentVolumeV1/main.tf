resource "kubernetes_persistent_volume_v1" "persistent_volume" {
  dynamic "metadata" {
    for_each = var.metadata_block[*]
    content {
      annotations = metadata.value.annotations
      labels      = metadata.value.labels
      name        = metadata.value.name
    }
  }

  dynamic "spec" {
    for_each = var.spec_block[*]
    content {
      access_modes = spec.value.access_modes
      capacity     = spec.value.capacity
      dynamic "persistent_volume_source" {
        for_each = spec.value.persistent_volume_source_block[*]
        content {
          dynamic "aws_elastic_block_store" {
            for_each = persistent_volume_source.value.aws_elastic_block_store_block[*]
            content {
              volume_id = aws_elastic_block_store.value.volume_id
              fs_type   = aws_elastic_block_store.value.fs_type
              partition = aws_elastic_block_store.value.partition
              read_only = aws_elastic_block_store.value.read_only
            }
          }
          dynamic "azure_disk" {
            for_each = persistent_volume_source.value.azure_disk_block[*]
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
            for_each = persistent_volume_source.value.azure_file_block[*]
            content {
              secret_name      = azure_file.value.secret_name
              share_name       = azure_file.value.share_name
              read_only        = azure_file.value.read_only
              secret_namespace = azure_file.value.secret_namespace
            }
          }
          dynamic "ceph_fs" {
            for_each = persistent_volume_source.value.ceph_fs_block[*]
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
            for_each = persistent_volume_source.value.cinder_block[*]
            content {
              volume_id = cinder.value.volume_id
              fs_type   = cinder.value.fs_type
              read_only = cinder.value.read_only
            }
          }
          dynamic "csi" {
            for_each = persistent_volume_source.value.csi_block[*]
            content {
              driver        = csi.value.driver
              volume_handle = csi.value.volume_handle

              dynamic "controller_expand_secret_ref" {
                for_each = csi.value.controller_expand_secret_ref_block[*]
                content {
                  name      = controller_expand_secret_ref.value.name
                  namespace = controller_expand_secret_ref.value.namespace
                }
              }

              dynamic "controller_publish_secret_ref" {
                for_each = csi.value.controller_publish_secret_ref_block[*]
                content {
                  name      = controller_publish_secret_ref.value.name
                  namespace = controller_publish_secret_ref.value.namespace
                }
              }

              fs_type = csi.value.fs_type

              dynamic "node_publish_secret_ref" {
                for_each = csi.value.node_publish_secret_ref_block[*]
                content {
                  name      = node_publish_secret_ref.value.name
                  namespace = node_publish_secret_ref.value.namespace
                }
              }

              dynamic "node_stage_secret_ref" {
                for_each = csi.value.node_stage_secret_ref_block[*]
                content {
                  name      = node_stage_secret_ref.value.name
                  namespace = node_stage_secret_ref.value.namespace
                }
              }

              read_only         = csi.value.read_only
              volume_attributes = csi.value.volume_attributes
            }
          }

          dynamic "fc" {
            for_each = persistent_volume_source.value.fc_block[*]
            content {
              lun          = fc.value.lun
              target_ww_ns = fc.value.target_ww_ns
              fs_type      = fc.value.fs_type
              read_only    = fc.value.read_only
            }
          }

          dynamic "flex_volume" {
            for_each = persistent_volume_source.value.flex_volume_block[*]
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
            for_each = persistent_volume_source.value.flocker_block[*]
            content {
              dataset_name = flocker.value.dataset_name
              dataset_uuid = flocker.value.dataset_uuid
            }
          }

          dynamic "gce_persistent_disk" {
            for_each = persistent_volume_source.value.gce_persistent_disk_block[*]
            content {
              pd_name   = gce_persistent_disk.value.pd_name
              fs_type   = gce_persistent_disk.value.fs_type
              partition = gce_persistent_disk.value.partition
              read_only = gce_persistent_disk.value.read_only
            }
          }

          dynamic "glusterfs" {
            for_each = persistent_volume_source.value.glusterfs_block[*]
            content {
              endpoints_name = glusterfs.value.endpoints_name
              path           = glusterfs.value.path
              read_only      = glusterfs.value.read_only
            }
          }

          dynamic "host_path" {
            for_each = persistent_volume_source.value.host_path_block[*]
            content {
              path = host_path.value.path
              type = host_path.value.type
            }
          }

          dynamic "iscsi" {
            for_each = persistent_volume_source.value.iscsi_block[*]
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
            for_each = persistent_volume_source.value.local_block[*]
            content {
              path = local.value.path
            }
          }

          dynamic "nfs" {
            for_each = persistent_volume_source.value.nfs_block[*]
            content {
              path      = nfs.value.path
              server    = nfs.value.server
              read_only = nfs.value.read_only
            }
          }

          dynamic "photon_persistent_disk" {
            for_each = persistent_volume_source.value.photon_persistent_disk_block[*]
            content {
              pd_id   = photon_persistent_disk.value.pd_id
              fs_type = photon_persistent_disk.value.fs_type
            }
          }

          dynamic "quobyte" {
            for_each = persistent_volume_source.value.quobyte_block[*]
            content {
              registry  = quobyte.value.registry
              volume    = quobyte.value.volume
              group     = quobyte.value.group
              read_only = quobyte.value.read_only
              user      = quobyte.value.user
            }
          }

          dynamic "rbd" {
            for_each = persistent_volume_source.value.rbd_block[*]
            content {
              ceph_monitors = rbd.value.ceph_monitors
              rbd_image     = rbd.value.rbd_image
              fs_type       = rbd.value.fs_type
              keyring       = rbd.value.keyring
              rados_user    = rbd.value.rados_user
              rbd_pool      = rbd.value.rbd_pool
              read_only     = rbd.value.read_only
              dynamic "secret_ref" {
                for_each = rbd.value.secret_ref_block[*]
                content {
                  name      = secret_ref.value.name
                  namespace = secret_ref.value.namespace
                }
              }
            }
          }

          dynamic "vsphere_volume" {
            for_each = persistent_volume_source.value.vsphere_volume_block[*]
            content {
              volume_path = vsphere_volume.value.volume_path
              fs_type     = vsphere_volume.value.fs_type
            }
          }
        }
      }

      dynamic "claim_ref" {
        for_each = spec.value.claim_ref_block[*]
        content {
          name      = claim_ref.value.name
          namespace = claim_ref.value.namespace
        }
      }

      mount_options = spec.value.mount_options

      dynamic "node_affinity" {
        for_each = spec.value.node_affinity_block
        content {
          dynamic "required" {
            for_each = node_affinity.value.required_block[*]
            content {
              dynamic "node_selector_term" {
                for_each = required.value.node_selector_term_block[*]
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

      persistent_volume_reclaim_policy = spec.value.persistent_volume_reclaim_policy
      storage_class_name               = spec.value.storage_class_name
      volume_mode                      = spec.value.volume_mode
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
    }
  }
}