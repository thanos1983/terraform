resource "hcloud_volume" "volume" {
  name              = var.name
  size              = var.size
  labels            = var.labels
  server_id         = var.server_id
  location          = var.location
  automount         = var.automount
  format            = var.format
  delete_protection = var.delete_protection
}
