resource "azurerm_data_factory_trigger_tumbling_window" "data_factory_trigger_tumbling_window" {
  name            = var.name
  data_factory_id = var.data_factory_id
  frequency       = var.frequency
  interval        = var.interval

  dynamic "pipeline" {
    for_each = var.pipeline_block[*]
    content {
      name       = pipeline.value.name
      parameters = pipeline.value.parameters
    }
  }

  start_time            = var.start_time
  activated             = var.activated
  additional_properties = var.additional_properties
  annotations           = var.annotations
  delay                 = var.delay
  description           = var.description
  end_time              = var.end_time
  max_concurrency       = var.max_concurrency

  dynamic "retry" {
    for_each = var.retry_block[*]
    content {
      count    = retry.value.count
      interval = retry.value.interval
    }
  }

  dynamic "trigger_dependency" {
    for_each = var.trigger_dependency_block
    content {
      offset       = trigger_dependency.value.offset
      size         = trigger_dependency.value.size
      trigger_name = trigger_dependency.value.trigger_name
    }
  }

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
