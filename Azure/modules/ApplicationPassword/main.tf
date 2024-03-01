resource "azuread_application_password" "application_password" {
  application_id      = var.application_id
  display_name        = var.display_name
  end_date            = var.end_date
  end_date_relative   = var.end_date_relative
  rotate_when_changed = var.rotate_when_changed
  start_date          = var.start_date
}