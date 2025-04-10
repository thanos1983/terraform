resource "hcloud_placement_group" "placement_group" {
  name   = var.name
  type   = var.type
  labels = var.labels
}
