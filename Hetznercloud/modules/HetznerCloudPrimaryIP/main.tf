resource "hcloud_primary_ip" "primary_ip" {
  type              = var.type
  name              = var.name
  datacenter        = var.datacenter
  auto_delete       = var.auto_delete
  labels            = var.labels
  assignee_id       = var.assignee_id
  assignee_type     = var.assignee_type
  delete_protection = var.delete_protection
}
