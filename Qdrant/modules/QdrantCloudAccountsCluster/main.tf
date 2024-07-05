resource "qdrant-cloud_accounts_cluster" "accounts_cluster" {
  cloud_provider = var.cloud_provider
  cloud_region   = var.cloud_region

  dynamic "configuration" {
    for_each = var.configuration_block
    content {
      dynamic "node_configuration" {
        for_each = configuration.value.node_configuration_block
        content {
          package_id = node_configuration.value.package_id
        }
      }
      num_nodes     = configuration.value.num_nodes
      num_nodes_max = configuration.value.num_nodes_max
    }
  }

  name               = var.name
  account_id         = var.account_id
  cloud_region_az    = var.cloud_region_az
  cloud_region_setup = var.cloud_region_setup
  encryption_key_id  = var.encryption_key_id
  private_region_id  = var.private_region_id
  total_extra_disk   = var.total_extra_disk
  version            = var.qdrant_cluster_version
}