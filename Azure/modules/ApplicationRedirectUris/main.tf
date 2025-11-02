resource "azuread_application_redirect_uris" "application_redirect_uris" {
  application_id = var.application_id
  redirect_uris  = var.redirect_uris
  type           = var.type
}
