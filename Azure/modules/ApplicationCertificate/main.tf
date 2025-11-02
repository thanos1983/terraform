resource "azuread_application_certificate" "application_certificate" {
  application_id    = var.application_id
  encoding          = var.encoding
  end_date          = var.end_date
  end_date_relative = var.end_date_relative
  key_id            = var.key_id
  start_date        = var.start_date
  type              = var.type
  value             = var.value

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
