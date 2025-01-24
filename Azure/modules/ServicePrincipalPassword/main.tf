resource "azuread_service_principal_password" "service_principal_password" {
  display_name         = var.display_name
  end_date             = var.end_date
  end_date_relative    = var.end_date_relative
  rotate_when_changed  = var.rotate_when_changed
  service_principal_id = var.service_principal_id
  start_date           = var.start_date

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      delete = timeouts.value.delete
    }
  }
}