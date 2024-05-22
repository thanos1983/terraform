resource "azapi_update_resource" "update_resource" {
  name                    = var.name
  parent_id               = var.parent_id
  resource_id             = var.resource_id
  type                    = var.type
  body                    = var.body
  response_export_values  = var.response_export_values
  locks                   = var.locks
  ignore_casing           = var.ignore_casing
  ignore_body_changes     = var.ignore_body_changes
  ignore_missing_property = var.ignore_missing_property

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      delete = timeouts.value.delete
    }
  }
}