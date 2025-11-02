resource "azuread_group" "group" {
  administrative_unit_ids    = var.administrative_unit_ids
  assignable_to_role         = var.assignable_to_role
  auto_subscribe_new_members = var.auto_subscribe_new_members
  behaviors                  = var.behaviors
  description                = var.description
  display_name               = var.display_name

  dynamic "dynamic_membership" {
    for_each = var.dynamic_membership_block[*]
    content {
      enabled = dynamic_membership.value.enabled
      rule    = dynamic_membership.value.rule
    }
  }

  external_senders_allowed  = var.external_senders_allowed
  hide_from_address_lists   = var.hide_from_address_lists
  hide_from_outlook_clients = var.hide_from_outlook_clients
  mail_enabled              = var.mail_enabled
  mail_nickname             = var.mail_nickname
  members                   = var.members
  onpremises_group_type     = var.onpremises_group_type
  owners                    = var.owners
  prevent_duplicate_names   = var.prevent_duplicate_names
  provisioning_options      = var.provisioning_options
  security_enabled          = var.security_enabled
  theme                     = var.theme
  types                     = var.types
  visibility                = var.visibility
  writeback_enabled         = var.writeback_enabled

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
