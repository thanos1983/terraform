resource "sysdig_secure_rule_syscall" "secure_rule_syscall" {
  name        = var.name
  description = var.description
  tags        = var.tags
  matching    = var.matching
  syscalls    = var.syscalls
}