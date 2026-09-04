resource "azurerm_container_app_environment" "container_app_environment" {
  name                                        = var.name
  resource_group_name                         = var.resource_group_name
  location                                    = var.location
  dapr_application_insights_connection_string = var.dapr_application_insights_connection_string
  infrastructure_subnet_id                    = var.infrastructure_subnet_id
  internal_load_balancer_enabled              = var.internal_load_balancer_enabled
  zone_redundancy_enabled                     = var.zone_redundancy_enabled
  log_analytics_workspace_id                  = var.log_analytics_workspace_id

  dynamic "workload_profile" {
    for_each = var.workload_profile_block[*]
    content {
      name                  = workload_profile.value.name
      workload_profile_type = workload_profile.value.workload_profile_type
      maximum_count         = workload_profile.value.maximum_count
      minimum_count         = workload_profile.value.minimum_count
    }
  }

  tags = var.tags

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