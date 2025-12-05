resource "hcloud_load_balancer_network" "load_balancer_network" {
  load_balancer_id        = var.load_balancer_id
  enable_public_interface = var.enable_public_interface
  ip                      = var.ip
  network_id              = var.network_id
  subnet_id               = var.subnet_id
}
