resource "azurerm_logic_app_trigger_recurrence" "logic_app_trigger_recurrence" {
  name         = var.name
  logic_app_id = var.logic_app_id
  frequency    = var.frequency
  interval     = var.interval
  start_time   = var.start_time
  time_zone    = var.time_zone

  dynamic "schedule" {
    for_each = var.schedule_block[*]
    content {
      at_these_minutes = schedule.value.at_these_minutes
      at_these_hours   = schedule.value.at_these_hours
      on_these_days    = schedule.value.on_these_days
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts_block[*]
    content {
      create = timeouts.value.create
      update = timeouts.value.update
      read   = timeouts.value.read
      delete = timeouts.value.delete
    }
  }
}
