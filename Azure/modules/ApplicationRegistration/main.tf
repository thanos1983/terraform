resource "azuread_application_registration" "application_registration" {
  description                            = var.description
  display_name                           = var.display_name
  group_membership_claims                = var.group_membership_claims
  homepage_url                           = var.homepage_url
  implicit_access_token_issuance_enabled = var.implicit_access_token_issuance_enabled
  implicit_id_token_issuance_enabled     = var.implicit_id_token_issuance_enabled
  logout_url                             = var.logout_url
  marketing_url                          = var.marketing_url
  notes                                  = var.notes
  privacy_statement_url                  = var.privacy_statement_url
  requested_access_token_version         = var.requested_access_token_version
  service_management_reference           = var.service_management_reference
  sign_in_audience                       = var.sign_in_audience
  support_url                            = var.support_url
  terms_of_service_url                   = var.terms_of_service_url
}