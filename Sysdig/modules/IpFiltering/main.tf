resource "sysdig_ip_filter" "ip_filter" {
  ip_range = var.ip_range
  enabled  = var.enabled
  note     = var.note
}
