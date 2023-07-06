resource "azurerm_data_factory_dataset_delimited_text" "data_factory_dataset_delimited_text" {
  name                = var.name
  data_factory_id     = var.data_factory_id
  linked_service_name = var.linked_service_name
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

  dynamic "azure_blob_fs_location" {
    for_each = var.azure_blob_fs_location_block[*]
    content {
      file_system = azure_blob_fs_location.value.file_system
      path        = azure_blob_fs_location.value.path
      filename    = azure_blob_fs_location.value.filename
    }
  }

  dynamic "azure_blob_storage_location" {
    for_each = var.azure_blob_storage_location_block[*]
    content {
      container                 = azure_blob_storage_location.value.container
      path                      = azure_blob_storage_location.value.path
      filename                  = azure_blob_storage_location.value.filename
      dynamic_container_enabled = azure_blob_storage_location.value.dynamic_container_enabled
      dynamic_path_enabled      = azure_blob_storage_location.value.dynamic_path_enabled
      dynamic_filename_enabled  = azure_blob_storage_location.value.dynamic_filename_enabled
    }
  }

  dynamic "http_server_location" {
    for_each = var.http_server_location_block[*]
    content {
      relative_url             = http_server_location.value.relative_url
      path                     = http_server_location.value.path
      filename                 = http_server_location.value.filename
      dynamic_path_enabled     = http_server_location.value.dynamic_path_enabled
      dynamic_filename_enabled = http_server_location.value.dynamic_filename_enabled
    }
  }

  column_delimiter    = var.column_delimiter
  row_delimiter       = var.row_delimiter
  encoding            = var.encoding
  quote_character     = var.quote_character
  escape_character    = var.escape_character
  first_row_as_header = var.first_row_as_header
  null_value          = var.null_value
  compression_codec   = var.compression_codec
  compression_level   = var.compression_level

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
