resource "sysdig_secure_scanning_policy" "secure_scanning_policy" {
  name    = var.name
  comment = var.comment

  dynamic "rules" {
    for_each = var.rules_blocks
    content {
      gate    = rules.value.gate
      trigger = rules.value.trigger
      dynamic "params" {
        for_each = rules.value.params_blocks
        content {
          name  = params.value.name
          value = params.value.value
        }
      }
      action = rules.value.action
    }
  }
}
