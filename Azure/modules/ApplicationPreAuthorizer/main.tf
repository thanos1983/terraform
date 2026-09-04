resource "azuread_application_pre_authorized" "pre_authorized" {
  application_id       = var.application_id
  authorized_client_id = var.authorized_client_id
  permission_ids       = var.permission_ids
}