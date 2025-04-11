resource "hcloud_floating_ip_assignment" "floating_ip_assignment" {
  floating_ip_id = var.floating_ip_id
  server_id      = var.server_id
}
