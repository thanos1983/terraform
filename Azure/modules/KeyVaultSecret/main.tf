resource "azurerm_key_vault_secret" "key_vault_secret" {
  name            = var.name
  value           = var.value
  key_vault_id    = var.key_vault_id
  content_type    = var.content_type
  tags            = var.tags
  not_before_date = var.not_before_date
  expiration_date = var.expiration_date

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
