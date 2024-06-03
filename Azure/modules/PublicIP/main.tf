resource "azurerm_public_ip" "public_ip" {
  name                    = var.name
  resource_group_name     = var.resource_group_name
  location                = var.location
  allocation_method       = var.allocation_method
  zones                   = var.zones
  ddos_protection_mode    = var.ddos_protection_mode
  ddos_protection_plan_id = var.ddos_protection_plan_id
  domain_name_label       = var.domain_name_label
  edge_zone               = var.edge_zone
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  ip_tags                 = var.ip_tags
  ip_version              = var.ip_version
  public_ip_prefix_id     = var.public_ip_prefix_id
  reverse_fqdn            = var.reverse_fqdn
  sku                     = var.sku
  sku_tier                = var.sku_tier
  tags                    = var.tags

  dynamic "lifecycle" {
    for_each = var.lifecycle_block[*]
    content {
      create_before_destroy = lifecycle.value.create_before_destroy
      prevent_destroy       = lifecycle.value.prevent_destroy
      ignore_changes        = lifecycle.value.ignore_changes
      replace_triggered_by  = lifecycle.value.replace_triggered_by
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