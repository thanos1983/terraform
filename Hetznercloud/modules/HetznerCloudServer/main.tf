resource "hcloud_server" "server" {
  name        = var.name
  server_type = var.server_type
  image       = var.image
  location    = var.location
  datacenter  = var.datacenter
  user_data   = var.user_data
  ssh_keys    = var.ssh_keys

  dynamic "public_net" {
    for_each = var.public_net_block[*]
    content {
      ipv4_enabled = public_net.value.ipv4_enabled
      ipv4         = public_net.value.ipv4
      ipv6_enabled = public_net.value.ipv6_enabled
      ipv6         = public_net.value.ipv6
    }
  }

  keep_disk                  = var.keep_disk
  iso                        = var.iso
  rescue                     = var.rescue
  labels                     = var.labels
  backups                    = var.backups
  firewall_ids               = var.firewall_ids
  ignore_remote_firewall_ids = var.ignore_remote_firewall_ids

  dynamic "network" {
    for_each = var.network_blocks
    content {
      network_id = network.value.network_id
      ip         = network.value.ip
      alias_ips  = network.value.alias_ips
    }
  }

  placement_group_id       = var.placement_group_id
  delete_protection        = var.delete_protection
  rebuild_protection       = var.rebuild_protection
  allow_deprecated_images  = var.allow_deprecated_images
  shutdown_before_deletion = var.shutdown_before_deletion
}
