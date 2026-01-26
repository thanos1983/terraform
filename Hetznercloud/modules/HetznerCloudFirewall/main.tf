resource "hcloud_firewall" "firewall" {
  name   = var.name
  labels = var.labels

  dynamic "rule" {
    for_each = var.rule_blocks[*]
    content {
      direction       = rule.value.direction
      protocol        = rule.value.protocol
      port            = rule.value.protocol
      source_ips      = rule.value.source_ips
      destination_ips = rule.value.destination_ips
    }
  }

  dynamic "apply_to" {
    for_each = var.apply_to_block[*]
    content {
      label_selector = apply_to.value.label_selector
      server         = apply_to.value.server
    }
  }
}
