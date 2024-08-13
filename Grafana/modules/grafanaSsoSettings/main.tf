resource "grafana_sso_settings" "sso_settings" {
  provider_name = var.provider_name

  dynamic "oauth2_settings" {
    for_each = var.oauth2_settings_block[*]
    content {
      client_id                  = oauth2_settings.value.client_id
      allow_assign_grafana_admin = oauth2_settings.value.allow_assign_grafana_admin
      allow_sign_up              = oauth2_settings.value.allow_sign_up
      allowed_domains            = oauth2_settings.value.allowed_domains
      allowed_groups             = oauth2_settings.value.allowed_groups
      allowed_organizations      = oauth2_settings.value.allowed_organizations
      api_url                    = oauth2_settings.value.api_url
      auth_style                 = oauth2_settings.value.auth_style
      auth_url                   = oauth2_settings.value.auth_url
      auto_login                 = oauth2_settings.value.auto_login
      client_secret              = oauth2_settings.value.client_secret
      custom                     = oauth2_settings.value.custom
      define_allowed_groups      = oauth2_settings.value.define_allowed_groups
      define_allowed_teams_ids   = oauth2_settings.value.define_allowed_teams_ids
      email_attribute_name       = oauth2_settings.value.email_attribute_name
      email_attribute_path       = oauth2_settings.value.email_attribute_path
      empty_scopes               = oauth2_settings.value.empty_scopes
      enabled                    = oauth2_settings.value.enabled
      groups_attribute_path      = oauth2_settings.value.groups_attribute_path
      id_token_attribute_name    = oauth2_settings.value.id_token_attribute_name
      login_attribute_path       = oauth2_settings.value.login_attribute_path
      name                       = oauth2_settings.value.name
      name_attribute_path        = oauth2_settings.value.name_attribute_path
      org_attribute_path         = oauth2_settings.value.org_attribute_path
      org_mapping                = oauth2_settings.value.org_mapping
      role_attribute_path        = oauth2_settings.value.role_attribute_path
      role_attribute_strict      = oauth2_settings.value.role_attribute_strict
      scopes                     = oauth2_settings.value.scopes
      signout_redirect_url       = oauth2_settings.value.signout_redirect_url
      skip_org_role_sync         = oauth2_settings.value.skip_org_role_sync
      team_ids                   = oauth2_settings.value.team_ids
      team_ids_attribute_path    = oauth2_settings.value.team_ids_attribute_path
      teams_url                  = oauth2_settings.value.teams_url
      tls_client_ca              = oauth2_settings.value.tls_client_ca
      tls_client_cert            = oauth2_settings.value.tls_client_cert
      tls_client_key             = oauth2_settings.value.tls_client_key
      tls_skip_verify_insecure   = oauth2_settings.value.tls_skip_verify_insecure
      token_url                  = oauth2_settings.value.token_url
      use_pkce                   = oauth2_settings.value.use_pkce
      use_refresh_token          = oauth2_settings.value.use_refresh_token
    }
  }

  dynamic "saml_settings" {
    for_each = var.saml_settings_block[*]
    content {
      allow_idp_initiated        = saml_settings.value.allow_idp_initiated
      allow_sign_up              = saml_settings.value.allow_sign_up
      allowed_organizations      = saml_settings.value.allowed_organizations
      assertion_attribute_email  = saml_settings.value.assertion_attribute_email
      assertion_attribute_groups = saml_settings.value.assertion_attribute_groups
      assertion_attribute_login  = saml_settings.value.assertion_attribute_login
      assertion_attribute_name   = saml_settings.value.assertion_attribute_name
      assertion_attribute_org    = saml_settings.value.assertion_attribute_org
      assertion_attribute_role   = saml_settings.value.assertion_attribute_role
      auto_login                 = saml_settings.value.auto_login
      certificate                = saml_settings.value.certificate
      certificate_path           = saml_settings.value.certificate_path
      client_id                  = saml_settings.value.client_id
      client_secret              = saml_settings.value.client_secret
      enabled                    = saml_settings.value.enabled
      force_use_graph_api        = saml_settings.value.force_use_graph_api
      idp_metadata               = saml_settings.value.idp_metadata
      idp_metadata_path          = saml_settings.value.idp_metadata_path
      idp_metadata_url           = saml_settings.value.idp_metadata_url
      max_issue_delay            = saml_settings.value.max_issue_delay
      metadata_valid_duration    = saml_settings.value.metadata_valid_duration
      name                       = saml_settings.value.name
      name_id_format             = saml_settings.value.name_id_format
      org_mapping                = saml_settings.value.org_mapping
      private_key                = saml_settings.value.private_key
      private_key_path           = saml_settings.value.private_key_path
      relay_state                = saml_settings.value.relay_state
      role_values_admin          = saml_settings.value.role_values_admin
      role_values_editor         = saml_settings.value.role_values_editor
      role_values_grafana_admin  = saml_settings.value.role_values_grafana_admin
      role_values_none           = saml_settings.value.role_values_none
      role_values_viewer         = saml_settings.value.role_values_viewer
      signature_algorithm        = saml_settings.value.signature_algorithm
      single_logout              = saml_settings.value.single_logout
      skip_org_role_sync         = saml_settings.value.skip_org_role_sync
      token_url                  = saml_settings.value.token_url
    }
  }
}