resource "hcloud_server_network" "server_network" {
  server_id  = var.server_id
  alias_ips  = var.alias_ips
  network_id = var.network_id
  subnet_id  = var.subnet_id
  ip         = var.ip
}
