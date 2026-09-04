resource "azurerm_extended_location_custom_location" "extended_location_custom_location" {
  name                  = var.name
  resource_group_name   = var.resource_group_name
  location              = var.location
  namespace             = var.namespace
  cluster_extension_ids = var.cluster_extension_ids
  host_resource_id      = var.host_resource_id

  dynamic "authentication" {
    for_each = var.authentication_block[*]
    content {
      type  = authentication.value.type
      value = authentication.value.value
    }
  }

  display_name = var.display_name
  host_type    = var.host_type

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