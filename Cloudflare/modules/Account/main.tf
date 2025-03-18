resource "cloudflare_account" "account" {
  name = var.name
  type = var.type

  dynamic "settings" {
    for_each = var.settings_block[*]
    content {
      abuse_contact_email = settings.value.abuse_contact_email
      default_nameservers = settings.value.default_nameservers
      dynamic "cloudlfare" {
        for_each = settings.value.cloudlfare_block[*]
        content {
          standard = cloudlfare.value.standard
        }
      }
      dynamic "custom" {
        for_each = settings.value.custom_block[*]
        content {
          account = custom.value.account
          tenant  = custom.value.tenant
        }
      }
    }
  }

  dynamic "unit" {
    for_each = var.unit_block[*]
    content {
      id = unit.value.id
    }
  }
}
