resource "sysdig_secure_rule_process" "secure_rule_process" {
  name        = var.name
  description = var.description
  tags        = var.tags
  matching    = var.matching
  processes   = var.processes
}