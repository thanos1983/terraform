resource "azuread_application_optional_claims" "application_optional_claims" {
  dynamic "access_token" {
    for_each = var.access_token_blocks[*]
    content {
      additional_properties = access_token.value.additional_properties
      essential             = access_token.value.essential
      name                  = access_token.value.name
      source                = access_token.value.source
    }
  }

  application_id = var.application_id

  dynamic "id_token" {
    for_each = var.id_token_blocks[*]
    content {
      additional_properties = id_token.value.additional_properties
      essential             = id_token.value.essential
      name                  = id_token.value.name
      source                = id_token.value.source
    }
  }

  dynamic "saml2_token" {
    for_each = var.saml2_token_blocks[*]
    content {
      additional_properties = saml2_token.value.additional_properties
      essential             = saml2_token.value.essential
      name                  = saml2_token.value.name
      source                = saml2_token.value.source
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}
