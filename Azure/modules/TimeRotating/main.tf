resource "time_rotating" "rotating" {
  rfc3339          = var.rfc3339
  rotation_days    = var.rotation_days
  rotation_hours   = var.rotation_hours
  rotation_minutes = var.rotation_minutes
  rotation_months  = var.rotation_months
  rotation_rfc3339 = var.rotation_rfc3339
  rotation_years   = var.rotation_years
  triggers         = var.triggers

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}