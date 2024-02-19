resource "azurerm_container_app_environment_storage" "container_app_environment_storage" {
  name                         = var.name
  access_key                   = var.access_key
  access_mode                  = var.access_mode
  account_name                 = var.account_name
  container_app_environment_id = var.container_app_environment_id
  share_name                   = var.share_name

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