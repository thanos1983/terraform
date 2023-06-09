locals {}

data "azuread_service_principal" "mssql_server" {
  display_name = var.name
  depends_on   = [
    azurerm_mssql_server.mssql_server
  ]
}