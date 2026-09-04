resource "azurerm_lb_probe" "lb_probe" {
  name                = var.name
  loadbalancer_id     = var.loadbalancer_id
  protocol            = var.protocol
  port                = var.port
  probe_threshold     = var.probe_threshold
  request_path        = var.request_path
  interval_in_seconds = var.interval_in_seconds
  number_of_probes    = var.number_of_probes

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