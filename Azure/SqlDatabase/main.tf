resource "azurerm_sql_database" "sql_database" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  server_name         = ""

  tags = var.tags
}