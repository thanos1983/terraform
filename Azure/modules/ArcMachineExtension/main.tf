resource "azurerm_arc_machine_extension" "arc_machine_extension" {
  arc_machine_id            = var.arc_machine_id
  location                  = var.location
  name                      = var.name
  publisher                 = var.publisher
  type                      = var.type
  automatic_upgrade_enabled = var.automatic_upgrade_enabled
  force_update_tag          = var.force_update_tag
  protected_settings        = var.protected_settings
  settings                  = var.settings
  tags                      = var.tags
  type_handler_version      = var.type_handler_version

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
