resource "time_static" "static" {
  rfc3339  = var.rfc3339
  triggers = var.triggers
}