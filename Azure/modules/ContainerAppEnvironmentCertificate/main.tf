resource "azurerm_container_app_environment_certificate" "container_app_environment_certificate" {
  name                         = var.name
  container_app_environment_id = var.container_app_environment_id
  certificate_blob_base64      = var.certificate_blob_base64
  certificate_password         = var.certificate_password
  tags                         = var.tags

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