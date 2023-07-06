resource "azapi_resource" "df_dataset_azure_sql_server" {
  type      = "Microsoft.DataFactory/factories/datasets@2018-06-01"
  name      = var.name
  parent_id = var.data_factory_id
  body      = jsonencode({
    properties = {
      annotations = var.propertiesAnnotations
      description = var.propertiesAnnotations
      folder      = {
        name = var.propertiesFolder
      }
      linkedServiceName = {
        parameters    = var.linkedServiceParameters
        referenceName = var.linkedServiceReferenceName
        type          = var.linkedServiceType
      }
      parameters     = var.propertiesParameters
      type           = var.propertiesType
      structure      = var.propertiesStructure
      typeProperties = {
        schema    = var.propertiesTypePropertiesSchema
        table     = var.propertiesTypePropertiesTable
        tableName = var.propertiesTypePropertiesTableName
      }
    }
  })
}