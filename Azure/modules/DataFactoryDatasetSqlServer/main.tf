resource "azurerm_data_factory_dataset_sql_server_table" "data_factory_dataset_sql_server_table" {
  name                = var.name
  data_factory_id     = var.data_factory_id
  linked_service_name = var.linked_service_name
  table_name          = var.table_name
  folder              = var.folder

  dynamic "schema_column" {
    for_each = var.schema_column_block
    content {
      name        = schema_column.value.name
      type        = schema_column.value.type
      description = schema_column.value.description
    }
  }

  description           = var.description
  annotations           = var.annotations
  parameters            = var.parameters
  additional_properties = var.additional_properties

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
