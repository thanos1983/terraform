resource "azuread_application_password" "application_password" {
  application_id      = var.application_id
  display_name        = var.display_name
  end_date            = var.end_date
  end_date_relative   = var.end_date_relative
  rotate_when_changed = var.rotate_when_changed
  start_date          = var.start_date
}

# Store the Primary Access Key in KV
module "keyvault_secret" {
  source       = "../KeyVaultSecret"
  count        = var.key_vault_id == null ? 0 : 1
  tags         = var.tags
  name         = var.display_name
  key_vault_id = var.key_vault_id
  value        = azuread_application_password.application_password.value
  depends_on   = [
    azuread_application_password.application_password
  ]
}