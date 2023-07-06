resource "azurerm_data_factory_pipeline" "data_factory_pipeline" {
  name                           = var.name
  data_factory_id                = var.data_factory_id
  description                    = var.description
  annotations                    = var.annotations
  concurrency                    = var.concurrency
  folder                         = var.folder
  moniter_metrics_after_duration = var.moniter_metrics_after_duration
  parameters                     = var.parameters
  variables                      = var.variables
  activities_json                = var.activities_json

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
