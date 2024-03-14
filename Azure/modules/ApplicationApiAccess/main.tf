resource "azuread_application_api_access" "application_api_access" {
  api_client_id  = var.api_client_id
  application_id = var.application_id
  role_ids       = var.role_ids
  scope_ids      = var.scope_ids
}