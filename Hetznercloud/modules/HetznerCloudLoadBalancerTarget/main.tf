resource "hcloud_load_balancer_target" "load_balancer_target" {
  type             = var.type
  load_balancer_id = var.load_balancer_id
  server_id        = var.server_id
  label_selector   = var.label_selector
  ip               = var.ip
  use_private_ip   = var.use_private_ip
}
