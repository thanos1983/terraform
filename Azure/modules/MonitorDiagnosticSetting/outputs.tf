output "id" {
  description = "Monitor Diagnostics Setting ID."
  value       = azurerm_monitor_diagnostic_setting.monitor_diagnostic_setting.id
}

output "name" {
  description = "Monitor Diagnostics Setting Name."
  value       = azurerm_monitor_diagnostic_setting.monitor_diagnostic_setting.name
}