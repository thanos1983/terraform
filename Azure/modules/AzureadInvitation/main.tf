resource "azuread_invitation" "invitation" {
  dynamic "message" {
    for_each = var.message_block[*]
    content {
      additional_recipients = message.value.additional_recipients
      body                  = message.value.body
      language              = message.value.language
    }
  }

  redirect_url       = var.redirect_url
  user_display_name  = var.user_display_name
  user_email_address = var.user_email_address
  user_type          = var.user_type

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      delete = timeouts.value.delete
    }
  }
}
