resource "azurerm_data_factory_trigger_schedule" "data_factory_trigger_schedule" {
  name            = var.name
  data_factory_id = var.data_factory_id
  description     = var.description

  dynamic "schedule" {
    for_each = var.schedule_block
    content {
      days_of_month = schedule.value.days_of_month
      days_of_week  = schedule.value.days_of_week
      hours         = schedule.value.hours
      minutes       = schedule.value.minutes
      dynamic "monthly" {
        for_each = schedule.value.monthlies
        content {
          weekday = monthly.value.weekday
          week    = monthly.value.week
        }
      }
    }
  }

  start_time = var.start_time
  time_zone  = var.time_zone
  end_time   = var.end_time
  interval   = var.interval
  frequency  = var.frequency
  activated  = var.activated

  dynamic "pipeline" {
    for_each = var.pipeline_block[*]
    content {
      name       = pipeline.value.name
      parameters = pipeline.value.parameters
    }
  }

  pipeline_name       = var.pipeline_name
  pipeline_parameters = var.pipeline_parameters

  annotations = var.annotations

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
