resource "azurerm_mssql_firewall_rule" "mssql_firewall_rule" {
  name             = var.name
  server_id        = var.server_id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address

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
