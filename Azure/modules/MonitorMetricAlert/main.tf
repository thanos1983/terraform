resource "azurerm_monitor_metric_alert" "azurerm_monitor_metric_alert" {
  name                = var.name
  resource_group_name = var.resource_group_name
  scopes              = var.scopes

  dynamic "criteria" {
    for_each = var.criteria_blocks
    content {
      metric_namespace = criteria.value.metric_namespace
      metric_name      = criteria.value.metric_name
      aggregation      = criteria.value.aggregation
      operator         = criteria.value.operator
      threshold        = criteria.value.threshold
      dynamic "dimension" {
        for_each = criteria.value.dimension_blocks
        content {
          name     = dimension.value.name
          operator = dimension.value.operator
          values   = dimension.value.values
        }
      }
      skip_metric_validation = criteria.value.skip_metric_validation
    }
  }

  dynamic "dynamic_criteria" {
    for_each = var.dynamic_criteria_block[*]
    content {
      metric_namespace  = dynamic_criteria.value.metric_namespace
      metric_name       = dynamic_criteria.value.metric_name
      aggregation       = dynamic_criteria.value.aggregation
      operator          = dynamic_criteria.value.operator
      alert_sensitivity = dynamic_criteria.value.alert_sensitivity
      dynamic "dimension" {
        for_each = dynamic_criteria.value.dimension_blocks
        content {
          name     = dimension.value.name
          operator = dimension.value.operator
          values   = dimension.value.values
        }
      }
      evaluation_total_count   = dynamic_criteria.value.evaluation_total_count
      evaluation_failure_count = dynamic_criteria.value.evaluation_failure_count
      ignore_data_before       = dynamic_criteria.value.ignore_data_before
      skip_metric_validation   = dynamic_criteria.value.skip_metric_validation
    }
  }

  dynamic "application_insights_web_test_location_availability_criteria" {
    for_each = var.application_insights_web_test_location_availability_criteria_block[*]
    content {
      web_test_id           = application_insights_web_test_location_availability_criteria.value.web_test_id
      component_id          = application_insights_web_test_location_availability_criteria.value.component_id
      failed_location_count = application_insights_web_test_location_availability_criteria.value.failed_location_count
    }
  }

  dynamic "action" {
    for_each = var.action_blocks
    content {
      action_group_id    = action.value.action_group_id
      webhook_properties = action.value.webhook_properties
    }
  }

  enabled                  = var.enabled
  auto_mitigate            = var.auto_mitigate
  description              = var.description
  frequency                = var.frequency
  severity                 = var.severity
  target_resource_type     = var.target_resource_type
  target_resource_location = var.target_resource_location
  window_size              = var.window_size
  tags                     = var.tags

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
