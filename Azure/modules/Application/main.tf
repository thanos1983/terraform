resource "azuread_application" "application" {
  dynamic "api" {
    for_each = var.api_block[*]
    content {
      known_client_applications = api.value.known_client_applications
      mapped_claims_enabled     = api.value.mapped_claims_enabled
      dynamic "oauth2_permission_scope" {
        for_each = api.value.oauth2_permission_scope_blocks
        content {
          admin_consent_description  = oauth2_permission_scope.value.admin_consent_description
          admin_consent_display_name = oauth2_permission_scope.value.admin_consent_display_name
          enabled                    = oauth2_permission_scope.value.enabled
          id                         = oauth2_permission_scope.value.id
          type                       = oauth2_permission_scope.value.type
          user_consent_description   = oauth2_permission_scope.value.user_consent_description
          user_consent_display_name  = oauth2_permission_scope.value.user_consent_display_name
          value                      = oauth2_permission_scope.value.value
        }
      }
      requested_access_token_version = api.value.requested_access_token_version
    }
  }

  dynamic "app_role" {
    for_each = var.app_role_blocks
    content {
      allowed_member_types = app_role.value.allowed_member_types
      description          = app_role.value.description
      display_name         = app_role.value.display_name
      id                   = app_role.value.id
      value                = app_role.value.value
    }
  }

  description                    = var.description
  device_only_auth_enabled       = var.device_only_auth_enabled
  display_name                   = var.display_name
  fallback_public_client_enabled = var.fallback_public_client_enabled

  dynamic "feature_tags" {
    for_each = var.feature_tags_block[*]
    content {
      custom_single_sign_on = feature_tags.value.custom_single_sign_on
      enterprise            = feature_tags.value.enterprise
      gallery               = feature_tags.value.gallery
      hide                  = feature_tags.value.hide
    }
  }

  group_membership_claims       = var.group_membership_claims
  identifier_uris               = var.identifier_uris
  logo_image                    = var.logo_image
  marketing_url                 = var.marketing_url
  notes                         = var.notes
  oauth2_post_response_required = var.oauth2_post_response_required

  dynamic "optional_claims" {
    for_each = var.optional_claims_block[*]
    content {
      dynamic "access_token" {
        for_each = optional_claims.value.access_token_blocks
        content {
          additional_properties = access_token.value.additional_properties
          essential             = access_token.value.essential
          name                  = access_token.value.name
          source                = access_token.value.source
        }
      }
      dynamic "id_token" {
        for_each = optional_claims.value.id_token_blocks
        content {
          additional_properties = id_token.value.additional_properties
          essential             = id_token.value.essential
          name                  = id_token.value.name
          source                = id_token.value.source
        }
      }
      dynamic "saml2_token" {
        for_each = optional_claims.value.saml2_token_blocks
        content {
          additional_properties = saml2_token.value.additional_properties
          essential             = saml2_token.value.essential
          name                  = saml2_token.value.name
          source                = saml2_token.value.source
        }
      }
    }
  }

  owners                  = var.owners
  prevent_duplicate_names = var.prevent_duplicate_names
  privacy_statement_url   = var.privacy_statement_url

  dynamic "public_client" {
    for_each = var.public_client_block[*]
    content {
      redirect_uris = public_client.value.redirect_uris
    }
  }

  dynamic "required_resource_access" {
    for_each = var.required_resource_access_blocks
    content {
      resource_app_id = required_resource_access.value.resource_app_id
      dynamic "resource_access" {
        for_each = required_resource_access.value.resource_access_blocks
        content {
          id   = resource_access.value.id
          type = resource_access.value.type
        }
      }
    }
  }

  service_management_reference = var.service_management_reference
  sign_in_audience             = var.sign_in_audience

  dynamic "single_page_application" {
    for_each = var.single_page_application_block[*]
    content {
      redirect_uris = single_page_application.value.redirect_uris
    }
  }

  support_url          = var.support_url
  tags                 = var.tags
  template_id          = var.template_id
  terms_of_service_url = var.terms_of_service_url

  dynamic "web" {
    for_each = var.web_block[*]
    content {
      homepage_url = web.value.homepage_url
      dynamic "implicit_grant" {
        for_each = web.value.implicit_grant_block[*]
        content {
          access_token_issuance_enabled = implicit_grant.value.access_token_issuance_enabled
          id_token_issuance_enabled     = implicit_grant.value.id_token_issuance_enabled
        }
      }
      logout_url    = web.value.logout_url
      redirect_uris = web.value.redirect_uris
    }
  }
}