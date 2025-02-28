resource "sysdig_secure_rule_container" "secure_rule_container" {
  name        = var.name
  description = var.description
  tags        = var.tags
  matching    = var.matching
  containers  = var.containers
}