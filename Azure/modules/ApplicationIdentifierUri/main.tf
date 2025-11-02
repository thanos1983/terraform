resource "azuread_application_identifier_uri" "identifier_uri" {
  application_id = var.application_id
  identifier_uri = var.identifier_uri
}
