resource "azuread_service_principal" "service_principal" {
  account_enabled              = var.account_enabled
  alternative_names            = var.alternative_names
  app_role_assignment_required = var.app_role_assignment_required
  client_id                    = var.client_id
  description                  = var.description

  dynamic "feature_tags" {
    for_each = var.feature_tags_block[*]
    content {
      custom_single_sign_on = feature_tags.value.custom_single_sign_on
      enterprise            = feature_tags.value.enterprise
      gallery               = feature_tags.value.gallery
      hide                  = feature_tags.value.hide
    }
  }

  login_url                     = var.login_url
  notes                         = var.notes
  notification_email_addresses  = var.notification_email_addresses
  owners                        = var.owners
  preferred_single_sign_on_mode = var.preferred_single_sign_on_mode

  dynamic "saml_single_sign_on" {
    for_each = var.saml_single_sign_on_block[*]
    content {
      relay_state = saml_single_sign_on.value.relay_state
    }
  }

  use_existing = var.use_existing
  tags         = var.tags
}

module "application_password" {
  source              = "../ApplicationPassword"
  count               = var.key_vault_id == null ? 0 : 1
  application_id      = var.application_id
  key_vault_id        = var.key_vault_id
  display_name        = var.display_name
  end_date            = var.end_date
  end_date_relative   = var.end_date_relative
  rotate_when_changed = var.rotate_when_changed
  start_date          = var.start_date
  tags                = var.kv_secret_tags
}
