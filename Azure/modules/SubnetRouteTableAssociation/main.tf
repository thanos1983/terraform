resource "azurerm_subnet_route_table_association" "subnet_route_table_association" {
  route_table_id = ""
  subnet_id      = ""

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