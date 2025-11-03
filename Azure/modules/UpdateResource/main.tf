resource "azapi_update_resource" "update_resource" {
  type                    = var.type
  body                    = var.body
  ignore_casing           = var.ignore_casing
  ignore_missing_property = var.ignore_missing_property
  locks                   = var.locks
  name                    = var.name
  parent_id               = var.parent_id
  read_headers            = var.read_headers
  read_query_parameters   = var.read_query_parameters
  resource_id             = var.resource_id
  response_export_values  = var.response_export_values

  dynamic "retry" {
    for_each = var.retry_block[*]
    content {
      error_message_regex  = retry.value.error_message_regex
      interval_seconds     = retry.value.interval_seconds
      max_interval_seconds = retry.value.max_interval_seconds
    }
  }

  sensitive_body          = var.sensitive_body
  sensitive_body_version  = var.sensitive_body_version
  update_headers          = var.update_headers
  update_query_parameters = var.update_query_parameters

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      delete = timeouts.value.delete
    }
  }
}
