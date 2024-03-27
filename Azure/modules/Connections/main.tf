resource "azapi_resource" "connections" {
  type                      = var.type
  name                      = var.name
  location                  = var.location
  parent_id                 = var.parent_id
  tags                      = var.tags
  schema_validation_enabled = var.schema_validation_enabled

  body = jsonencode({
    properties = {
      api                      = var.api
      customParameterValues    = var.customParameterValues
      displayName              = var.displayName
      parameterValueSet        = var.parameterValueSet
      nonSecretParameterValues = var.nonSecretParameterValues
      parameterValues          = var.parameterValues
      statuses                 = var.statuses
      testLinks                = var.testLinks
    }
  })

  ignore_body_changes = [
    "properties.customParameterValues", "properties.statuses", "properties.testLinks"
  ]

  #  lifecycle {
  #    ignore_changes = all
  #  }
}