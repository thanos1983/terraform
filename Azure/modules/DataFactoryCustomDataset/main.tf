resource "azurerm_data_factory_custom_dataset" "data_factory_custom_dataset" {
  name            = var.name
  data_factory_id = var.data_factory_id

  linked_service {
    name       = var.linked_service_name
    parameters = var.linked_service_parameters
  }

  type                  = var.type
  type_properties_json  = var.type_properties_json
  additional_properties = var.additional_properties
  annotations           = var.annotations
  description           = var.description
  folder                = var.folder
  parameters            = var.parameters
  schema_json           = var.schema_json

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
