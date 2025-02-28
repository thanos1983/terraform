resource "sysdig_secure_rule_network" "secure_rule_network" {
  name           = var.name
  description    = var.description
  tags           = var.tags
  block_inbound  = var.block_inbound
  block_outbound = var.block_outbound

  dynamic "tcp" {
    for_each = var.tcp_block[*]
    content {
      matching = tcp.value.matching
      ports    = tcp.value.ports
    }
  }

  dynamic "udp" {
    for_each = var.udp_block[*]
    content {
      matching = udp.value.matching
      ports    = udp.value.ports
    }
  }
}