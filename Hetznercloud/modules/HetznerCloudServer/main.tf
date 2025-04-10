resource "hcloud_server" "server" {
  name        = var.name
  server_type = ""
  image       = ""
  location    = ""
  datacenter  = ""
  user_data   = ""
  ssh_keys = []

  public_net {
    ipv4_enabled = true
    ipv4         = ""
    ipv6_enabled = true
    ipv6         = ""
  }

  keep_disk                  = ""
  iso                        = ""
  rescue                     = ""
  labels                     = var.labels
  backups                    = ""
  firewall_ids = []
  ignore_remote_firewall_ids = ""

  network {
    network_id = 0
    ip         = ""
    alias_ips = []
  }

  placement_group_id       = ""
  delete_protection        = var.delete_protection
  rebuild_protection       = ""
  allow_deprecated_images  = ""
  shutdown_before_deletion = ""
}
