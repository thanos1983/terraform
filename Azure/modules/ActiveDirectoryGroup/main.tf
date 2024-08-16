resource "azuread_group" "group" {
  administrative_unit_ids = []
  assignable_to_role = ""
  auto_subscribe_new_members = ""
  behaviors = []
  description = ""
  display_name        = var.display_name

  dynamic_membership {
    enabled = false
    rule    = ""
  }

  external_senders_allowed = ""
  hide_from_address_lists = ""
  hide_from_outlook_clients = ""
  mail_enabled = ""
  mail_nickname = ""
  members = []
  onpremises_group_type = ""
  owners = []
  prevent_duplicate_names = ""
  provisioning_options = []
  security_enabled = ""
  theme = ""
  types = []
  visibility = ""
  writeback_enabled = ""

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