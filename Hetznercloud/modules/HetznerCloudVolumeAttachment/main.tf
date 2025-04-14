resource "hcloud_volume_attachment" "volume_attachment" {
  volume_id = var.volume_id
  server_id = var.server_id
  automount = var.automount
}
