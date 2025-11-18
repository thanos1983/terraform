resource "ansible_playbook" "playbook" {
  name                    = var.name
  playbook                = var.playbook
  ansible_playbook_binary = var.ansible_playbook_binary
  check_mode              = var.check_mode
  diff_mode               = var.diff_mode
  extra_vars              = var.extra_vars
  force_handlers          = var.force_handlers
  groups                  = var.groups
  ignore_playbook_failure = var.ignore_playbook_failure
  limit                   = var.limit
  replayable              = var.replayable
  tags                    = var.tags
  var_files               = var.var_files
  vault_files             = var.vault_files
  vault_id                = var.vault_id
  vault_password_file     = var.vault_password_file
  verbosity               = var.verbosity

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
    }
  }
}
