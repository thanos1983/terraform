resource "azapi_resource" "container_app_job" {
  type                      = "Microsoft.App/jobs@2025-07-01"
  name                      = var.name
  location                  = var.location
  parent_id                 = var.parent_id
  tags                      = var.tags
  ignore_casing             = var.ignore_casing
  ignore_missing_property   = var.ignore_missing_property
  schema_validation_enabled = var.schema_validation_enabled

  dynamic "identity" {
    for_each = var.identity_block[*]
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  body = jsonencode({
    properties = {
      configuration = {
        eventTriggerConfig    = var.eventTriggerConfig
        manualTriggerConfig   = var.manualTriggerConfig
        registries            = var.registries
        replicaRetryLimit     = var.replicaRetryLimit
        replicaTimeout        = var.replicaTimeout
        scheduleTriggerConfig = var.scheduleTriggerConfig
        secrets               = var.secrets
        triggerType           = var.triggerType
      }

      environmentId = var.environmentId

      template = {
        containers     = var.containers
        initContainers = var.initContainers
        volumes        = var.volumes
      }

      workloadProfileName = var.workloadProfileName
    }
  })

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      delete = timeouts.value.delete
    }
  }
}
