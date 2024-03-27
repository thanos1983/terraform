resource "azapi_resource" "connections" {
  type      = var.type
  name      = var.name
  location  = var.location
  parent_id = var.parent_id
  tags      = var.tags

  body = jsonencode({
    properties = {
      api                      = var.api
      customParameterValues    = var.customParameterValues
      displayName              = var.displayName
      nonSecretParameterValues = var.nonSecretParameterValues
      parameterValues          = var.parameterValues
      statuses                 = var.statuses
      testLinks                = var.testLinks
    }
  })
}