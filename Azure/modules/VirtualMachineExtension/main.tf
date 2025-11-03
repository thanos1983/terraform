resource "azurerm_virtual_machine_extension" "virtual_machine_extension" {
  name                        = var.name
  virtual_machine_id          = var.virtual_machine_id
  publisher                   = var.publisher
  type                        = var.type
  type_handler_version        = var.type_handler_version
  auto_upgrade_minor_version  = var.auto_upgrade_minor_version
  automatic_upgrade_enabled   = var.automatic_upgrade_enabled
  settings                    = var.settings
  failure_suppression_enabled = var.failure_suppression_enabled
  protected_settings          = var.protected_settings

  dynamic "protected_settings_from_key_vault" {
    for_each = var.protected_settings_from_key_vault_block[*]
    content {
      secret_url      = protected_settings_from_key_vault.value.secret_url
      source_vault_id = protected_settings_from_key_vault.value.source_vault_id
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }

  tags = var.tags
}
