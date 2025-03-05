resource "time_offset" "offset" {
  base_rfc3339   = var.base_rfc3339
  offset_days    = var.offset_days
  offset_hours   = var.offset_hours
  offset_minutes = var.offset_minutes
  offset_months  = var.offset_months
  offset_seconds = var.offset_seconds
  offset_years   = var.offset_years
  triggers       = var.triggers
}