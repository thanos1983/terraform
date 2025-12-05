resource "hcloud_server_network" "server_network" {
  server_id  = var.server_id
  alias_ips  = var.alias_ips
  ip         = var.ip
  network_id = var.network_id
  subnet_id  = var.subnet_id
}
