resource "hcloud_network" "network" {
  name                     = var.name
  ip_range                 = var.ip_range
  labels                   = var.labels
  delete_protection        = var.delete_protection
  expose_routes_to_vswitch = var.expose_routes_to_vswitch
}
