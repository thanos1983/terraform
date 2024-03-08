resource "azuread_application_permission_scope" "application_permission_scope" {
  admin_consent_description  = var.admin_consent_description
  admin_consent_display_name = var.admin_consent_display_name
  application_id             = var.application_id
  scope_id                   = var.scope_id
  type                       = var.type
  user_consent_description   = var.user_consent_description
  user_consent_display_name  = var.user_consent_display_name
  value                      = var.value
}