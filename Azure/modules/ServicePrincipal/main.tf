resource "azuread_service_principal" "service_principal" {
  account_enabled              = ""
  alternative_names            = ""
  app_role_assignment_required = ""
  application_id               = ""
  description                  = ""

  feature_tags {
    custom_single_sign_on = ""
    enterprise            = ""
    gallery               = ""
    hide                  = ""
  }

  login_url                     = ""
  notes                         = ""
  notification_email_addresses  = ""
  owners                        = ""
  preferred_single_sign_on_mode = ""

  saml_single_sign_on {
    relay_state = ""
  }

  use_existing = ""
  tags         = null
}