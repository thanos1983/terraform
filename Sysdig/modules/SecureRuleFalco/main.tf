resource "sysdig_secure_rule_falco" "secure_rule_falco" {
  name        = var.name
  description = var.description
  tags        = var.tags
  condition   = var.condition
  output      = var.output
  priority    = var.priority
  source      = var.event_source

  dynamic "exceptions" {
    for_each = var.exceptions_blocks
    content {
      name   = exceptions.value.name
      fields = exceptions.value.fields
      comps  = exceptions.value.comps
      values = exceptions.value.values
    }
  }

  append                 = var.append
  minimum_engine_version = var.minimum_engine_version

}