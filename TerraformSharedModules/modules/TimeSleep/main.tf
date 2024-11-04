resource "time_sleep" "sleep" {
  create_duration  = var.create_duration
  destroy_duration = var.destroy_duration
  triggers         = var.triggers
}