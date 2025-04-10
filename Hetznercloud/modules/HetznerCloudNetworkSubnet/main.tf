resource "hcloud_network_subnet" "network_subnet" {
  network_id   = var.network_id
  type         = var.type
  ip_range     = var.ip_range
  network_zone = var.network_zone
  vswitch_id   = var.vswitch_id
}
